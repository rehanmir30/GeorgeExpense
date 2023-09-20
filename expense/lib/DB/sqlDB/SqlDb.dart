
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';

import '../../Controllers/sqlController/SqlController.dart';
import '../../Models/category.dart';



class SqlDb {
  // var catagoryList = [
  //   "Category",
  //   "Housing",
  //   "Transportation",
  //   "Food",
  //   "Utilities",
  //   "Insurance",
  //   "Medical & Healthcare",
  //   "Saving, Investing, & Debt Payments",
  //   "Personal Spending",
  //   "Recreation & Entertainment",
  //   "Miscellaneous"
  // ];

  // var databaseName;
  // var databaseVersion;
   Future<Database> FindDatabase(DatabaseName,Databaseversion,Database) async {
    if (Database != null) return Database!;
    // lazily instantiate the db the first time it is accessed
    Database = await _initDatabase(DatabaseName,Databaseversion);
    return Database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase(DatabaseName,Databaseversion) async {
    final documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, DatabaseName);
    return await openDatabase(path, version: Databaseversion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE Categories(id INTEGER PRIMARY KEY AUTOINCREMENT, cat_name TEXT, cat_image TEXT, cat_type NUM)',
    );
    // await db.execute(
    //   'CREATE TABLE transactions(transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,transaction_category_id INTEGER,transaction_amount TEXT, transaction_type TEXT,transaction_bank_id TEXT, transaction_description TEXT, transaction_time TEXT, CONSTRAINT fk_transaction_category_id FOREIGN KEY(transaction_category_id) REFERENCES category(category_id)  ON DELETE CASCADE)',
    // );
    // await db.execute(
    //   'CREATE TABLE category(category_id INTEGER PRIMARY KEY AUTOINCREMENT, category_name TEXT)',
    // );
    // await db.execute(
    //   'CREATE TABLE notification(notification_id INTEGER PRIMARY KEY AUTOINCREMENT, notification_title TEXT,notification_content TEXT,notification_time TEXT)',
    // );
  }

  Future<void> deleteTables() async {
    // Get the path to the database file
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'expense.db');

    // Open the database
    Database database = await openDatabase(path);

    // Execute SQL statements to drop the tables
    await database.delete('Categories');

    SqlController sqlController = Get.find<SqlController>();
    // await sqlController.getTransactions();

    // Close the database
    // await database.close();
  }



  //Bank Inserted
   Future<int> category_insert(CategoryModel banks, MyDatabase) async {
     // Get a reference to the database.
     final Database db = await MyDatabase;

     try {
       int id = await db.insert('Categories', banks.toMap());
       print('Db Category Inserted');
       return id;
     } catch (e) {
       print('DbException' + e.toString());
       return -1;
     }
   }

   //Delete Bank
   Future<void> deleteBank(int id,MyDatabase) async {
     final db = await MyDatabase;

     await db.delete(
       'Categories',
       where: 'id = ?',
       whereArgs: [id],
     );
     // await db.delete(
     //   'package_items',
     //   where: 'item_package_id = ?',
     //   whereArgs: [id],
     // );
     print("Package deleted at"+ id.toString());
   }

   // Future<int> notification_insert(NotificationModel notificationModel, MyDatabase) async {
   //   // Get a reference to the database.
   //   final Database db = await MyDatabase;
   //
   //   try {
   //     int id = await db.insert('notification', notificationModel.toMap());
   //     print('Db notification Inserted');
   //     return id;
   //   } catch (e) {
   //     print('DbException' + e.toString());
   //     return -1;
   //   }
   // }
   //
   // //Insert transaction
   // Future<int> transaction_insert(TransactionModel transaction, MyDatabase) async {
   //   // Get a reference to the database.
   //   final Database db = await MyDatabase;
   //   try {
   //     int id = await db.insert('transactions', transaction.toMap());
   //     print('Db transaction Inserted');
   //     return id;
   //   } catch (e) {
   //     print('DbException' + e.toString());
   //     return -1;
   //   }
   // }



   //Delete Transaction
  Future<void> deleteTransaction(String searchString) async {
    // Open the database
    final database = openDatabase(
      join(await getDatabasesPath(), 'expense.db'),
    );

    // Delete any rows that match the search criteria
    await database.then((db) =>
        db.delete('transactions', where: 'transaction_time LIKE ?',
            whereArgs: ['%$searchString%']));
  }

   // //Get all banks
   // Future<List<Banks>> getAllBanks(MyDatabase) async {
   //   Database db = await MyDatabase;
   //   final List<Map<String, dynamic>> maps = await db.rawQuery("select * from `bank`");
   //
   //   return List.generate(maps.length, (i) {
   //     return Banks(
   //         id: maps[i]['id'],
   //         BankName: maps[i]['bank_name'],
   //         Image: maps[i]['bank_image'],
   //     );
   //   });
   // }
   //
   // //Get all transactions
   // Future<List<TransactionModel>> getAllTransactions(MyDatabase) async {
   //   Database db = await MyDatabase;
   //   final List<Map<String, dynamic>> maps = await db.rawQuery("select * from `transactions`");
   //
   //   return List.generate(maps.length, (i) {
   //     return TransactionModel(
   //       transactionId: maps[i]["transaction_id"],
   //       transactionAmount: maps[i]["transaction_amount"],
   //       transactionCategoryId: maps[i]["transaction_category_id"],
   //       transactionDescription: maps[i]["transaction_description"],
   //       transactionTime: maps[i]["transaction_time"],
   //       transactionType: maps[i]["transaction_type"],
   //       transactionBankId: maps[i]["transaction_bank_id"],
   //     );
   //   });
   // }
   //
   // Future<List<NotificationModel>> getAllNotifications(MyDatabase) async {
   //   Database db = await MyDatabase;
   //   final List<Map<String, dynamic>> maps = await db.rawQuery("select * from `notification`");
   //
   //   return List.generate(maps.length, (i) {
   //     return NotificationModel(
   //       notificationId: maps[i]["notification_id"],
   //       notificationTitle: maps[i]["notification_title"],
   //       notificationContent: maps[i]["notification_content"],
   //       notificationTime: maps[i]["notification_time"],
   //     );
   //   });
   // }
   //
   // //Get all categories
   // Future<List<CategoryModel>> getAllCategories(MyDatabase) async {
   //   Database db = await MyDatabase;
   //   final List<Map<String, dynamic>> maps = await db.rawQuery("select * from `category`");
   //
   //   if(maps.length!=0){
   //     return List.generate(maps.length, (i) {
   //       return CategoryModel(
   //         categoryId: maps[i]['category_id'],
   //         categoryName: maps[i]['category_name'],
   //       );
   //     });
   //   }else{
   //     int id =await setAllCategories(MyDatabase);
   //     if(id==-1){
   //       Fluttertoast.showToast(msg: "Something Went wrong");
   //        return await setAllCategories(MyDatabase);
   //     }
   //     else{
   //      return await getAllCategories(MyDatabase);
   //     }
   //
   //   }
   // }

   //Set all categories
   // setAllCategories(MyDatabase) async {
   //   final Database db = await MyDatabase;
   //   int index=1;
   //   int id=1;
   //   for(var i in catagoryList){
   //     try {
   //       CategoryModel categoryModel = CategoryModel(categoryId: index,categoryName: i);
   //       id = await db.insert('category', categoryModel.toMap());
   //       index++;
   //       print('Db category Inserted');
   //     } catch (e) {
   //       print('DbException' + e.toString());
   //       return -1;
   //     }
   //   }
   //   return id;
   //
   //
   //
   // }

}