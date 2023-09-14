import 'package:expense/AppColors/colors.dart';
import 'package:expense/ui/home/CreateCategory/CreateNewCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,color: AppColor.primaryColor,)),
        backgroundColor: AppColor.kWhite,
        elevation: 0,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.12,),
            Image.asset("assets/images/FinanceIcon/MONEY FLUJO.png",width: 100,height: 100,),
            SizedBox(height: 70,),

            Center(
              child: Column(
                children: [
                  InkWell(
                    onTap:(){
                      Get.to(()=>const CreateNewCategory());
                    },
                    child:Image.asset("assets/images/addIcon.png",width: 100,height: 100,) ,),
                  SizedBox(height: 20,),
                  Text('CREATE CATEGORY',style: TextStyle(fontSize: 25)),
                ],
              ),
            )
          ]),
    );
  }
}
