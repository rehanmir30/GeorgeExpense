import 'package:expense/Models/category.dart';
import 'package:expense/ui/home/CreateCategory/category_transaction_screen.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../DB/sqlDB/SqlDb.dart';
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
   // List<TransactionModel>? _transactionsList;
   // List<TransactionModel>? get transactionsList=>_transactionsList;
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

   // List<TransactionModel>? _specificBankTransactionsList=[];
   // List<TransactionModel>? get specificBankTransactionsList=>_specificBankTransactionsList;

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
     // getCategories();
     // await getNotifications();
     // await getEarlierNotifications();
     // await getTodayNotifications();
  }

   category_insert(CategoryModel category)async{
     int id = await sqlDb.category_insert(category,database);
     print(id);
     Get.to(()=>CategoryTransactionScreen(categoryModel: category,));
     getAllCategories();
     update();
     return id;
   }

   insert_entries_in_recpected_tables(CategoryModel categoryModel)async{

     await category_insert(categoryModel);
     if(categoryModel.transactionList!=null && (categoryModel.transactionList?.isNotEmpty??false)){
       for(var i in categoryModel.transactionList!){
         print(i.transactionName);
         await transaction_insert(i);

       }
     }

   }

   // notification_insert(NotificationModel notificationModel)async{
   //   int id = await sqlDb.notification_insert(notificationModel,database);
   //   print(id);
   //   update();
   //   return id;
   // }
   //
   transaction_insert(TransactionModel transaction) async {
     SqlDb sqlDb = SqlDb();
     await sqlDb.transaction_insert(transaction, database);
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
   // getTransactions() async{
   //   SqlDb sqlDb = SqlDb();
   //   _transactionsList =await sqlDb.getAllTransactions(database);
   //   if(_transactionsList!.isNotEmpty){
   //     getPieTransactionList();
   //     getPieTransactionTotal();
   //     calculateDifference();
   //   }
   //   update();
   // }
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
  //  getSpecificBankTransaction(Banks banks)async{
  //    _specificBankTransactionsList!.clear();
  //    print("initialList: "+_specificBankTransactionsList!.length.toString());
  //    // SqlDb sqlDb =SqlDb();
  //    _specificBankTransactionsList= List.generate(transactionsList!.length, (i) {
  //      if(int.parse(transactionsList![i].transactionBankId)==banks.id){
  //        return TransactionModel(
  //          transactionId: transactionsList![i].transactionId,
  //          transactionAmount: transactionsList![i].transactionAmount,
  //          transactionCategoryId: transactionsList![i].transactionCategoryId,
  //          transactionDescription: transactionsList![i].transactionDescription,
  //          transactionTime: transactionsList![i].transactionTime,
  //          transactionType: transactionsList![i].transactionType,
  //          transactionBankId: transactionsList![i].transactionBankId,
  //        );}else{
  //        return TransactionModel();
  //      }
  //
  //    });
  //    update();
  //  }
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