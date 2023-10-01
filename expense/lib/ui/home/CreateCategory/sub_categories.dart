import 'package:expense/AppColors/colors.dart';
import 'package:expense/Controllers/DataController/DataController.dart';
import 'package:expense/Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import 'package:expense/Controllers/sqlController/SqlController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Models/category.dart';
import 'create_category_screen.dart';

class SubCategories extends StatefulWidget {
  final CategoryModel? categoryModel;
  const SubCategories(this.categoryModel,{super.key});

  @override
  State<SubCategories> createState() => _Sub_CategoriesState();
}

class _Sub_CategoriesState extends State<SubCategories> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 20,height: 20,),
                 InkWell(
                   onTap: (){
                     Get.back();
                   },
                   child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                         width: 35,
                         height: 35,
                         decoration: const BoxDecoration(
                           color: AppColor.kBlack,
                           shape: BoxShape.circle,
                         ),
                         child: const Icon(Icons.keyboard_arrow_left_outlined,color: AppColor.kWhite,),
                       ).marginOnly(right: 10),
                 )
              ],), Column(
        children: [
          const SizedBox(height: 20,),
          Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  // borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.kBlack, width: 1),
                ),
                child: InkWell(
                    overlayColor: const MaterialStatePropertyAll(
                        Colors.transparent),
                    onTap: () {
                      // if (index == 0) {
                      //   Get.to(() => const CreateCategoryScreen());
                      // }
                    },
                    child: Image.asset(
                      "${widget.categoryModel?.cat_image}",
                      width: 100,
                      height: 100,

                      fit: BoxFit.fill,
                    )),
              )
          ),

          SizedBox(height: 10,),


          Center(child: Text(widget.categoryModel?.cat_name.toUpperCase()??"",style: TextStyle(color: AppColor.kBlack,fontSize: 23,fontWeight: FontWeight.bold),),),
        ],
      ),

              const SizedBox(height: 10,),



              GetBuilder<EmojiPopUpController>(
                builder: (controller) {
                  if(Get.find<DataController>().subCategoryModelList?.isEmpty??true){
                    return Expanded(child: Center(child: InkWell(
                        onTap: (){

                        },
                        child: Text("Add Sub Categories",style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 20),)),));
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: Get.find<DataController>().subCategoryModelList?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: (index == 0)
                            ? const EdgeInsets.all(15)
                            : const EdgeInsets.all(0),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(10),
                          border: (index == 0)
                              ? Border.all(color: AppColor.kWhite, width: 0)
                              : Border.all(color: AppColor.kBlack, width: 1),
                        ),
                        child: InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            onTap: () {
                              if (index == 0) {
                                Get.to(() => const CreateCategoryScreen());
                              }
                            },
                            child: Image.asset(
                              Get.find<DataController>().subCategoryModelList?[index].cat_image??"assets/images/AnimalIcon/abeja.png",
                              width: 10,
                              height: 10,
                            )),
                      ).marginAll(10);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                  );
                },
              ),


      
      
          ],),
      ),

    );
  }
}