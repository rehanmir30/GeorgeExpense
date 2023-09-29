import 'dart:math';

import 'package:expense/AppColors/colors.dart';
import 'package:expense/Controllers/sqlController/SqlController.dart';
import 'package:expense/Models/category.dart';
import 'package:expense/Models/transaction_model.dart';
import 'package:expense/custom_widget/CustomEmojiPicker/custom_emoji_picker.dart';
import 'package:expense/ui/home/CreateCategory/sub_categories.dart';
import 'package:expense/widgets/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import 'category_transaction_screen.dart';

class CreateNewCategory extends StatefulWidget {
  const CreateNewCategory({super.key});

  @override
  State<CreateNewCategory> createState() => _CreateNewCategoryState();
}

class _CreateNewCategoryState extends State<CreateNewCategory>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  String? selected_image;
  bool sublevelCheck=true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 24, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.primaryColor,
            )),
        backgroundColor: AppColor.kWhite,
        elevation: 0,
      ),
      backgroundColor: AppColor.kWhite,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () async {
                 await showDialog(
                    context: context,
                    builder: (context) {
                      return EmojiTabController(
                          tabController: tabController,
                          AnimalEmoji:
                              Get.find<EmojiPopUpController>().AnimalEmoji,
                          BabyEmoji: Get.find<EmojiPopUpController>().BabyEmoji,
                          BusinessEmoji:
                              Get.find<EmojiPopUpController>().BusinessEmoji,
                          CarEmoji: Get.find<EmojiPopUpController>().CarEmoji,
                          EntertainmentEmoji: Get.find<EmojiPopUpController>()
                              .EntertainmentEmoji,
                          FamilyEmoji:
                              Get.find<EmojiPopUpController>().FamilyEmoji,
                          FinanceEmoji:
                              Get.find<EmojiPopUpController>().FinanceEmoji,
                          FoodAndDrinksEmoji: Get.find<EmojiPopUpController>()
                              .FoodAndDrinksEmoji,
                          GymEmoji: Get.find<EmojiPopUpController>().GymEmoji,
                          HealthCareEmoji:
                              Get.find<EmojiPopUpController>().HealthCareEmoji,
                          HomeEmoji: Get.find<EmojiPopUpController>().HomeEmoji,
                          ITComputerIEmoji:
                              Get.find<EmojiPopUpController>().ITComputerIEmoji,
                          MakupEmoji:
                              Get.find<EmojiPopUpController>().MakupEmoji,
                          RestaurantEmoji:
                              Get.find<EmojiPopUpController>().RestaurantEmoji,
                          RopaClothingEmoji: Get.find<EmojiPopUpController>()
                              .RopaClothingEmoji,
                          ServicesEmoji:
                              Get.find<EmojiPopUpController>().ServicesEmoji,
                          ShoppingEmoji:
                              Get.find<EmojiPopUpController>().ShoppingEmoji,
                          SportsEmoji:
                              Get.find<EmojiPopUpController>().SportsEmoji,
                          StatisticsEmoji:
                              Get.find<EmojiPopUpController>().StatisticsEmoji,
                          StudiesEducationEmoji:
                              Get.find<EmojiPopUpController>()
                                  .StudiesEducationEmoji,
                          SubscriptionEmoji: Get.find<EmojiPopUpController>()
                              .SubscriptionEmoji,
                          TransportEmoji:
                              Get.find<EmojiPopUpController>().TransportEmoji,
                          UsersEmoji:
                              Get.find<EmojiPopUpController>().UsersEmoji,
                          VacationEmoji:
                              Get.find<EmojiPopUpController>().VacationEmoji);
                    },
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.kBlack, width: 1),
                  ),
                  child:GetBuilder<EmojiPopUpController>(builder: (controller) {
                    return  (controller.selectedEmoji==null || controller.selectedEmoji=="" ||controller.selectedEmoji!.isEmpty)
                    ?Image.asset("assets/images/addIcon.png",fit: BoxFit.fill,)
                    :Image.asset("${Get.find<EmojiPopUpController>().selectedEmoji}",fit: BoxFit.fill);
                  },)
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child:  TextField(
                    style: const TextStyle(
                        color: AppColor.kBlack,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                    decoration: const InputDecoration(
                        hintText: "Enter Category Name",
                        hintStyle: TextStyle(fontSize: 18)),
                        onChanged: (value){
                          Get.find<EmojiPopUpController>().onChangeGlobleCategories(value);
                        },
                  )),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Single",
                style: TextStyle(
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ).marginOnly(right: 5),
              LiteRollingSwitch(
                width: 100,
                //initial value
                value: sublevelCheck,
                textOn: '',
                textOff: '',
                colorOn: AppColor.kGreen,
                colorOff: AppColor.kGreen,
                iconOn: Icons.arrow_forward_ios,
                iconOff: Icons.arrow_back_ios_new,
                textSize: 16.0,
                onChanged: (bool state) {
                  setState(() {
                    sublevelCheck=state;
                  });
                  //Use it to manage the different states
                  print('Current State of SWITCH IS: $state');
                },
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
              ),
              const Text(
                "Sublevels",
                style: TextStyle(
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ).marginOnly(left: 5),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            overlayColor: const MaterialStatePropertyAll(
              Colors.transparent
            ),
            onTap: (){
              Get.back();
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.kGrey,
                border: Border.all(width: 2, color: AppColor.kBlack),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'CANCEL',
                style: TextStyle(
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              if(sublevelCheck){
                if((Get.find<EmojiPopUpController>().globalCategories!=null && Get.find<EmojiPopUpController>().globalCategories!="") || (Get.find<EmojiPopUpController>().selectedEmoji!=null && Get.find<EmojiPopUpController>().selectedEmoji!="")){
                  var r = UniqueKey().toString();
                  CategoryModel? category=CategoryModel(
                    cat_id: r.toString(),
                    cat_name: Get.find<EmojiPopUpController>().globalCategories,
                    cat_image: Get.find<EmojiPopUpController>().selectedEmoji,
                    cat_type: 1,
                    main_cat_id: "general",
                  );
                  await Get.find<SqlController>().category_insert(category);
                  Get.to(()=>SubCategories(category));

                }else{
                  CustomSnackbar.show("Please fill all fields", AppColor.kRed);
                }
              }else{
                if((Get.find<EmojiPopUpController>().globalCategories!=null && Get.find<EmojiPopUpController>().globalCategories!="") || (Get.find<EmojiPopUpController>().selectedEmoji!=null && Get.find<EmojiPopUpController>().selectedEmoji!="")){
                  var r = UniqueKey().toString();
                  CategoryModel? category=CategoryModel(
                    cat_id: r.toString(),
                    cat_name: Get.find<EmojiPopUpController>().globalCategories,
                    cat_image: Get.find<EmojiPopUpController>().selectedEmoji,
                    cat_type: 0,
                    main_cat_id: "general",
                  );
                  await Get.find<SqlController>().category_insert(category);
                  Get.to(()=>CategoryTransactionScreen(categoryModel: category,));
                }else{
                  CustomSnackbar.show("Please fill all fields", AppColor.kRed);
                }
              }

            },
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.kYellow,
                border: Border.all(width: 2, color: AppColor.kBlack),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'SAVE',
                style: TextStyle(
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
