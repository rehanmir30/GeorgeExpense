
import 'category.dart';

class TopMonthExpenseModel {
  String? categoryName;
  String? totalExpense;

  TopMonthExpenseModel({this.categoryName, this.totalExpense});

  factory TopMonthExpenseModel.fromCategoryAndTotalExpense(
      CategoryModel category, double totalExpense) {
    return TopMonthExpenseModel(
      categoryName: category.cat_name,
      totalExpense: totalExpense.toStringAsFixed(2),
    );
  }
}

