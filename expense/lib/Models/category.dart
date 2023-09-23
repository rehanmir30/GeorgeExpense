import 'package:expense/Models/transaction_model.dart';

class CategoryModel{

  var id;
  var cat_id;
  var cat_name;
  var cat_image;
  var cat_type;
  var main_cat_id;
  List<TransactionModel>? transactionList=[];

  CategoryModel({
    this.id,
    this.cat_id,
    this.cat_name,
    this.cat_type,
    this.cat_image,
    this.main_cat_id,
    this.transactionList,
});

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    cat_id: json["cat_id"],
    cat_name: json["cat_name"],
    cat_image: json["cat_image"],
    cat_type: json["cat_type"],
    main_cat_id: json["main_cat_id"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "cat_id": cat_id,
    "cat_name": cat_name,
    "cat_image": cat_image,
    "cat_type": cat_type,
    "main_cat_id": main_cat_id
  };

}