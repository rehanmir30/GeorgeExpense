import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/Controllers/AuthController/auth_controller.dart';
import 'package:expense/DB/SharedPreference/SharedPref.dart';
import 'package:expense/ui/home/home.dart';
import 'package:expense/widgets/CustomSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../AppColors/colors.dart';
import '../Models/category.dart';
import '../Models/top_month_expense_model.dart';
import '../Models/transaction_model.dart';
import '../Models/user_model.dart';


class DatabaseHelper{


Future<void> signUp()async{
    try {

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: Get.find<AuthController>().email??"", password: Get.find<AuthController>().password??"");
     
      var userid = userCredential.user!.uid;
      UserModel userModel = UserModel(
        id: userid,
        name: Get.find<AuthController>().name,
        email: Get.find<AuthController>().email,
        createdAt: DateTime.now(),
        logout: false,
        updatedAt: DateTime.now()
      );
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userModel.id)
          .set(userModel.toMap());

      CustomSnackbar.show("Sign Up Successful", AppColor.kBlack);
      Get.find<AuthController>().clearFields();

      await Get.find<AuthController>().setUserData(userModel);
      await SharedPref.saveUser(userModel);
      Get.to(const HomeScreen(), transition: Transition.downToUp);
    } on FirebaseAuthException catch (error) {
      CustomSnackbar.show("${error.message}", AppColor.kRed);
    }
}


 //Login Function
  Future SignIn() async {
    AuthController authController = Get.find<AuthController>();
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: Get.find<AuthController>().email??"", password: Get.find<AuthController>().password??"");
      User? user = userCredential.user;

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .get()
          .then((value) async {
        UserModel myUser = UserModel.fromMap(value.data()!);
        await authController.setUserData(myUser);
        CustomSnackbar.show("Login Successful", AppColor.kBlack);
        await authController.setUserData(myUser);
        await SharedPref.saveUser(myUser);
        Get.offAll(const HomeScreen(), transition: Transition.downToUp);
      });
    } on FirebaseAuthException catch (error) {
      CustomSnackbar.show("${error.message}", AppColor.kRed);
    }
  }



List<TopMonthExpenseModel> calculateTopMonthExpenses(List<TransactionModel> transactions, List<CategoryModel> categories) {
  DateTime now = DateTime.now();
  int currentMonth = now.month;
  int currentYear = now.year;

  List<TransactionModel> currentMonthTransactions = transactions.where((transaction) {
    DateTime transactionDate = transaction.transactionDate;
    return transactionDate.month == currentMonth && transactionDate.year == currentYear;
  }).toList();

  Map<String, double> categoryTotalExpenses = {};
  currentMonthTransactions.forEach((transaction) {
    String categoryId = transaction.transactionCategoryId;
    double amount = double.parse(transaction.transactionAmount);
    categoryTotalExpenses[categoryId] = (categoryTotalExpenses[categoryId] ?? 0) + amount;
  });

  List<MapEntry<String, double>> sortedCategories = categoryTotalExpenses.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  List<TopMonthExpenseModel> topExpenses = [];
  for (int i = 0; i < sortedCategories.length && i < 5; i++) {
    String categoryId = sortedCategories[i].key;
    double totalExpense = sortedCategories[i].value;
    CategoryModel? category = categories.firstWhere((cat) => cat.cat_id == categoryId, orElse: () => CategoryModel());
    if (category.cat_name != null) {
      topExpenses.add(
        TopMonthExpenseModel.fromCategoryAndTotalExpense(category, totalExpense),
      );
    }
  }

  return topExpenses;
}


List<TransactionModel> getRecentTransactions(List<TransactionModel> transactions, int count) {
  // Sort transactions by transactionDate in descending order (most recent first)
  transactions.sort((a, b) => b.transactionDate.compareTo(a.transactionDate));

  // Take the first 'count' transactions
  return transactions.take(count).toList();
}








}