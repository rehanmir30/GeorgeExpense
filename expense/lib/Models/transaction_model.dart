
class TransactionModel{
  var transactionId;
  var transactionCategoryId;
  var transactionAmount;
  var transactionType;
  var transactionCatName;
  var transactionTime;


  TransactionModel({
      this.transactionId,
      this.transactionCategoryId,
      this.transactionAmount,
      this.transactionType,
      this.transactionCatName,
      this.transactionTime});

  factory TransactionModel.fromMap(Map<String, dynamic> json) => TransactionModel(
    transactionId: json["transaction_id"],
    transactionAmount: json["transaction_amount"],
    transactionCategoryId: json["transaction_cat_id"],
    transactionTime: json["transaction_time"],
    transactionType: json["transaction_type"],
    transactionCatName: json["transaction_name"],
  );

  Map<String, dynamic> toMap() => {
    "transaction_id": transactionId,
    "transaction_amount": transactionAmount,
    "transaction_cat_id": transactionCategoryId,
    "transaction_time": transactionTime,
    "transaction_type": transactionType,
    "transaction_name": transactionCatName,
  };

}