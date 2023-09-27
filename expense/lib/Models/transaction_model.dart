
import 'package:flutter/material.dart';

class TransactionModel{
  var transactionId;
  var transactionCategoryId;
  var transactionAmount;
  var transactionType;
  var transactionName;
  var transactionTime;
  var transactionDate;


  TransactionModel({
      this.transactionId,
      this.transactionCategoryId,
      this.transactionAmount,
      this.transactionType,
      this.transactionName,
    this.transactionDate,
      this.transactionTime});

  factory TransactionModel.fromMap(Map<String, dynamic> json) => TransactionModel(
    transactionId: json["transaction_id"],
    transactionAmount: json["transaction_amount"],
    transactionCategoryId: json["transaction_cat_id"],
    transactionTime: json["transaction_time"],
    transactionDate: json["transaction_date"],
    transactionType: json["transaction_type"],
    transactionName: json["transaction_name"],
  );

  Map<String, dynamic> toMap() => {
    "transaction_id": transactionId,
    "transaction_amount": transactionAmount,
    "transaction_cat_id": transactionCategoryId,
    "transaction_time": transactionTime.toString(),
    "transaction_date": transactionDate.toString(),
    "transaction_type": transactionType,
    "transaction_name": transactionName,
  };

}