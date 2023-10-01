import 'package:expense/DB/DatabaseHelper.dart';
import 'package:expense/Models/category.dart';
import 'package:expense/ui/home/CreateCategory/category_transaction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../DB/sqlDB/SqlDb.dart';
import '../../Models/top_month_expense_model.dart';
import '../../Models/transaction_model.dart';
import '../DataController/DataController.dart';

class SqlController extends GetxController{

   final _databaseName = "geowebExpense.db";
   final _databaseVersion = 1;
   SqlDb sqlDb = SqlDb();

   var No ="No Recent Data";

   String get databaseName => _databaseName;
   int get databaseVersion =>_databaseVersion;
   // List<CategoryModel>? _categoryList;
   // List<CategoryModel>? get categoryList=>_categoryList;
   //
   List<TransactionModel>? _transactionsList;
   List<TransactionModel>? get transactionsList=>_transactionsList;

   //Recent Transactions
   List<TransactionModel>? _recentTransactionsList;
   List<TransactionModel>? get recentTransactionsList=>_recentTransactionsList;

   double? _monthlyIncome =0.0;
   double? get monthlyIncome =>_monthlyIncome;

   double? _monthlyExpense =0.0;
   double? get monthlyExpense =>_monthlyExpense;

   //
   // List<NotificationModel>? _notificationList;
   // List<NotificationModel>? get notificationList =>_notificationList;
   //
   // List<TransactionModel> _pieTransactionsList=[];
   // List<TransactionModel>? get pieTransactionsList=>_pieTransactionsList;
   // List<TransactionModel> _pieChartTotal=[];
   // List<TransactionModel>? get pieChartTotal=>_pieChartTotal;
   final List<double> _pieTotal=[];
   List<double>? get pieTotal=>_pieTotal;

   List<TransactionModel>? _specificBankTransactionsList=[];
   List<TransactionModel>? get specificBankTransactionsList=>_specificBankTransactionsList;

   List<TopMonthExpenseModel> _topMonthExpense=[];
   List<TopMonthExpenseModel> get topMonthExpense=>_topMonthExpense;

   bool? _hasEarlierNotifications;
   bool? get hasEarlierNotifications =>_hasEarlierNotifications;

   bool? _hasTodayNotifications;
   bool? get hasTodayNotifications =>_hasTodayNotifications;


  Database? _database;
  Database?  get database =>_database;

   @override
  void onInit() {
    // TODO: implement onInit
      FindDatabase();
    super.onInit();
  }

  FindDatabase()async{
     _database = await sqlDb.FindDatabase(_databaseName,_databaseVersion,database);
    await getAllCategories();
    await getTransactions();
     // getCategories();
     // await getNotifications();
     // await getEarlierNotifications();
     // await getTodayNotifications();
  }

   category_insert(CategoryModel category)async{
     int id = await sqlDb.category_insert(category,database);
     print(id);
     getAllCategories();
     update();
     return id;
   }


  monthlyIncomeFunction()async{
     _monthlyIncome = transactionsList?.where((transaction) => transaction.transactionType == "1").map((transaction) => transaction.transactionAmount).fold(0.0, (a, b) => double.parse(a.toString()) + double.parse(b.toString()));
  print(transactionsList?.where((transaction) => transaction.transactionType == "1").map((transaction) => transaction.transactionAmount).fold(0.0, (a, b) => double.parse(a.toString()) + double.parse(b.toString())).toString());
   update();
   }


   monthlyExpenseFunction()async{
     _monthlyExpense = transactionsList?.where((transaction) => transaction.transactionType == "0").map((transaction) => transaction.transactionAmount).fold(0.0, (a, b) => double.parse(a.toString()) + double.parse(b.toString()));
     print(transactionsList?.where((transaction) => transaction.transactionType == "0").map((transaction) => transaction.transactionAmount).fold(0.0, (a, b) => double.parse(a.toString()) + double.parse(b.toString())).toString());
     update();
   }


   getSelectedSubCategories(CategoryModel? model) async {
     DataController dataController = Get.find<DataController>();
     List<CategoryModel>? listCategories;

     // Retrieve all categories from the database
     listCategories = await sqlDb.getAllCategories(database);

     // Filter categories by the specified cat_id
     List<CategoryModel>? filteredCategories = listCategories
         .where((category) => category.main_cat_id == model?.cat_id)
         .toList();

     // Add a default category (e.g., "Add Button") to the filtered list
     filteredCategories.insert(
       0,
       CategoryModel(
         transactionList: [],
         cat_id: "0",
         cat_image: "assets/images/addIcon.png",
         cat_name: "Add Button",
         cat_type: "2",
         id: "000",
         main_cat_id: "addButton",
       ),
     );

     // Reverse the filtered list if needed
     filteredCategories = filteredCategories.reversed.toList();

     // Update the data controller with the filtered categories
     await dataController.getSelectedSubCategories(filteredCategories);
     update();
   }


   // insert_entries_in_recpected_tables(CategoryModel categoryModel)async{
   //
   //   await category_insert(categoryModel);
   //   if(categoryModel.transactionList!=null && (categoryModel.transactionList?.isNotEmpty??false)){
   //     for(var i in categoryModel.transactionList!){
   //       print(i.transactionName);
   //       // await transaction_insert(context,i);
   //
   //     }
   //   }
   //
   // }

   // notification_insert(NotificationModel notificationModel)async{
   //   int id = await sqlDb.notification_insert(notificationModel,database);
   //   print(id);
   //   update();
   //   return id;
   // }
   //
   transaction_insert(BuildContext context, TransactionModel transaction) async {
     SqlDb sqlDb = SqlDb();
     await sqlDb.transaction_insert(context,transaction, database);
    //  await getTransactions();
    //  await getPieTransactionList();
     update();
   
   }
   //
   // deleteBank(id)async{
   //   await sqlDb.deleteBank(id, database);
   // }
   // //Deleting transaction
   // deleteTransaction(string)async{
   //   await sqlDb.deleteTransaction(string);
   //   getTransactions();
   //   update();
   // }
   //
   getAllCategories() async {
     DataController dataController = Get.find<DataController>();
     List<CategoryModel>? listCategories;
     // listCategories!.add(CategoryModel(transactionList: [],cat_id: "0",cat_image: "assets/images/addIcon.png",cat_name: "Add Button",cat_type: "2",id: "000",main_cat_id: "addButton"));
     listCategories = await sqlDb.getAllCategories(database);
     listCategories.insert(0,  CategoryModel(transactionList: [],cat_id: "0",cat_image: "assets/images/addIcon.png",cat_name: "Add Button",cat_type: "2",id: "000",main_cat_id: "addButton"));
     listCategories=listCategories.reversed.toList();
     await dataController.getAllCategories(listCategories);
     update();
   }
   //
   // getCategories() async {
   //   _categoryList = await sqlDb.getAllCategories(database);
   //   TransactionController transactionController = Get.find<TransactionController>();
   //   transactionController.getAllCategories(_categoryList!);
   //   getTransactions();
   //   if(_transactionsList!.isNotEmpty){
   //     getPieTransactionList();
   //   }
   // }
   //
   getTransactions() async{
     SqlDb sqlDb = SqlDb();
     _transactionsList =await sqlDb.getAllTransactions(database);
     monthlyIncomeFunction();
     monthlyExpenseFunction();
     if(transactionsList?.isNotEmpty??false){
       calculateTopMonthExpenses();
       getRecentTransactions();
     }
     // if(_transactionsList!.isNotEmpty){
       // getPieTransactionList();
       // getPieTransactionTotal();
       // calculateDifference();
     // }
     update();
   }


   calculateTopMonthExpenses()async{
      _topMonthExpense = DatabaseHelper().calculateTopMonthExpenses(transactionsList!,Get.find<DataController>().categoryModelList!);
     update();
   }

   getRecentTransactions()async{
     _recentTransactionsList =DatabaseHelper().getRecentTransactions(transactionsList!,5);
     update();
   }
   //
   // getNotifications()async{
   //   _notificationList?.clear();
   //   SqlDb sqlDb = SqlDb();
   //   _notificationList=await sqlDb.getAllNotifications(database);
   //   update();
   // }
   //
   // getEarlierNotifications()async{
   //   _hasEarlierNotifications =_notificationList!.any((notification) {
   //
   //     DateTime notificationDate = DateTime.parse(notification.notificationTime);
   //     DateTime notificationDateWithoutTime = DateTime(notificationDate.year, notificationDate.month, notificationDate.day);
   //     DateTime current = DateTime.now();
   //     DateTime today = DateTime(current.year, current.month, current.day);
   //     return notificationDateWithoutTime != today;
   //   });
   //   update();
   // }
   //
   // getTodayNotifications()async{
   //   _hasTodayNotifications =_notificationList!.any((notification) {
   //
   //     DateTime notificationDate = DateTime.parse(notification.notificationTime);
   //     DateTime notificationDateWithoutTime = DateTime(notificationDate.year, notificationDate.month, notificationDate.day);
   //     DateTime current = DateTime.now();
   //     DateTime today = DateTime(current.year, current.month, current.day);
   //     return notificationDateWithoutTime == today;
   //   });
   //   update();
   // }

  //  calculateDifference()async{
  //    _pieTotal.clear();
  //    double IncomeSum=0;
  //    double ExpenseSum=0;
  //    for(var i in transactionsList!){
  //      if(i.transactionType =="Incomming"){
  //        IncomeSum+=double.parse(i.transactionAmount.toString());
  //      }else{
  //        ExpenseSum+=double.parse(i.transactionAmount.toString());
  //      }
  //    }
  //    print("TOTAL: "+"Income: ${IncomeSum}"+" Expense: ${ExpenseSum}");
  //    _pieTotal.add(IncomeSum);
  //    _pieTotal.add(ExpenseSum);
  //    update();
  //  }
  //  getPieTransactionList()async{
  //    _pieTransactionsList.clear();
  //    for(var i in transactionsList!) {
  //      bool result = containsPieTransaction(i);
  //      if (result == false) {
  //        _pieTransactionsList.add(i);
  //      }
  //    }
  //    update();
  //  }
  //  getPieTransactionTotal()async{
  //    // _pieChartTotal.clear();
  //    for(var i in transactionsList!) {
  //        _pieChartTotal.add(i);
  //
  //    }
  //    update();
  //  }
  //
    getSpecificBankTransaction(CategoryModel categoryModel) {
     _specificBankTransactionsList?.clear();

     _specificBankTransactionsList = transactionsList
         ?.where((transaction) =>
     transaction.transactionCategoryId == categoryModel.cat_id)
         .map((transaction) => TransactionModel(
       transactionId: transaction.transactionId,
       transactionAmount: transaction.transactionAmount,
       transactionCategoryId: transaction.transactionCategoryId,
       transactionTime: transaction.transactionTime,
       transactionType: transaction.transactionType,
       transactionName: transaction.transactionName,
       transactionDate: transaction.transactionDate,
     ))
         .toList();

     print("Specific Transactions: ${_specificBankTransactionsList?.length}");
     update();
   }

//
  //
  //  bool? containsTransaction(TransactionModel transactionModel) {
  //    return transactionsList?.any((b) => b.transactionCategoryId == transactionModel.transactionCategoryId);
  //  }
  //  bool containsPieTransaction(TransactionModel transactionModel) {
  //    return pieTransactionsList!.any((b) => b.transactionCategoryId == transactionModel.transactionCategoryId);
  //  }
  // int containPieTransaction(TransactionModel transactionModel) {
  //    int foundIndex =-1;
  //    pieTransactionsList!.indexWhere((b) {
  //      if (b.transactionCategoryId == transactionModel.transactionCategoryId) {
  //        // b.transactionAmount += transactionModel.transactionAmount;
  //        foundIndex =pieTransactionsList!.indexOf(b);
  //        update();
  //        return true;
  //      }
  //      else{
  //        return false;
  //      }
  //    });
  //    return foundIndex;
  //  }
  //
  //
  //  double calculateTotalExpense() {
  //    return _transactionsList!.fold(0.0, (previousValue, element) {
  //      if (element.transactionType == "Expense") {
  //        return previousValue + double.parse(element.transactionAmount);
  //      } else {
  //        return previousValue;
  //      }
  //    });
  //  }
  //  double calculateTotalIncome() {
  //    return _transactionsList!.fold(0.0, (previousValue, element) {
  //      if (element.transactionType == "Incomming") {
  //        return previousValue + double.parse(element.transactionAmount);
  //      } else {
  //        return previousValue;
  //      }
  //    });
  //  }
  //
  //
  //  double calculateTotalExpenseOfCategory(TransactionModel transactionModel) {
  //    return _transactionsList!.fold(0.0, (previousValue, nextValue) {
  //      if (nextValue.transactionType == "Expense") {
  //       if(double.parse(nextValue.transactionCategoryId.toString())==double.parse(transactionModel.transactionCategoryId.toString())){
  //         return previousValue + double.parse(nextValue.transactionAmount);
  //       }else{
  //        return previousValue;
  //       }
  //      } else {
  //        return previousValue;
  //      }
  //    });
  //  }
  //  double calculateTotalIncomeOfCategory(TransactionModel transactionModel) {
  //    return _transactionsList!.fold(0.0, (previousValue, nextValue) {
  //      if (nextValue.transactionType == "Incomming") {
  //        if(double.parse(nextValue.transactionCategoryId.toString())==double.parse(transactionModel.transactionCategoryId.toString())){
  //          return previousValue + double.parse(nextValue.transactionAmount);
  //        }else{
  //          return previousValue;
  //        }
  //      } else {
  //        return previousValue;
  //      }
  //    });
  //  }
  //
  //
  //  double calculateTotal(TransactionModel transactionModel){
  //    double expense = calculateTotalExpenseOfCategory(transactionModel);
  //    double income = calculateTotalIncomeOfCategory(transactionModel);
  //    return income-expense;
  //  }
  //  Color calculateDifferenceColor(TransactionModel transactionModel) {
  //    double difference = calculateTotal(transactionModel);
  //    Color re = difference >= 0.0 ? Colors.green : Colors.red;
  //    print("Result: "+difference.toString());
  //    return  re;
  //
  //  }
  //
  //  String formatDateTime(String dateTimeString) {
  //    final dateTime = DateTime.parse(dateTimeString);
  //    final formattedTime = DateFormat('hh:mm a').format(dateTime);
  //    return formattedTime;
  //  }




}