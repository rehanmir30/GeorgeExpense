

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/category.dart';

class DataController extends GetxController{


  //  CategoryModel(transactionList: [],cat_id: "0",cat_image: "assets/images/addIcon.png",cat_name: "Add Button",cat_type: "2",id: "000",main_cat_id: "addButton")
  List<CategoryModel>? _categoryModelList=[];
  List<CategoryModel>? get categoryModelList=>_categoryModelList;


  getAllCategories(List<CategoryModel>? categoriesList)async{
    _categoryModelList = categoriesList;
    update();
  }





  Future<DateTime?> selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2500),
    );
    // if (picked != null && picked != selectedDate) {
    //   setState(() {
    //     selectedDate = picked;
    //   });
    // }
  }

  Future<TimeOfDay?> selectTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    // if (picked != null && picked != selectedTime) {
    //   setState(() {
    //     selectedTime = picked;
    //   });
    // }
  }


  updateUI()async{
    update();
  }



}