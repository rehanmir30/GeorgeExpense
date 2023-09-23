import 'package:flutter/material.dart';


class TransactionEntryListModel{

  final String? sourceName;
  final String? sourceAmount;
  final bool? isIncome;
  final String? time;
  final String? date;
  final String? id;

  TransactionEntryListModel({this.sourceName,this.sourceAmount,this.isIncome,this.date,this.time,this.id});

  factory TransactionEntryListModel.fromMap(Map<String, dynamic> json) => TransactionEntryListModel(
      sourceName: json["sourceName"],
      sourceAmount: json["sourceAmount"],
      isIncome: json["isIncome"],
      time: json["time"],
      date: json["date"],
      id: json["id"]
  );

  Map<String, dynamic> toMap() => {
    "sourceName": sourceName,
    "sourceAmount": sourceAmount,
    "isIncome": isIncome,
    "time": time,
    "date": date,
    "id": id
  };
}