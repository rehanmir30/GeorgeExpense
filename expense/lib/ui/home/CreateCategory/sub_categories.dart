import 'package:expense/AppColors/colors.dart';
import 'package:expense/Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_category_screen.dart';

class SubCategories extends StatefulWidget {
  const SubCategories({super.key});

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
              children: [
                const SizedBox(width: 10),
                 Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                       width: 35,
                       height: 35,
                       decoration: const BoxDecoration(
                         color: AppColor.kBlack,
                         shape: BoxShape.circle,
                       ),
                       child: const Icon(Icons.keyboard_arrow_left_outlined,color: AppColor.kWhite,),
                     ).marginOnly(right: 10)
              ],),

              const SizedBox(height: 10,),

              GetBuilder<EmojiPopUpController>(
                builder: (controller) {
                  return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.selectedList?.length,
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
                            child: Hero(
                                tag: "category",
                                child: Image.asset(
                                  controller.selectedList?[index]??"assets/images/AnimalIcon/abeja.png",
                                  width: 10,
                                  height: 10,
                                ))),
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