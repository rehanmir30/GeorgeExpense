import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../AppColors/colors.dart';
import '../../../Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import '../../../custom_widget/CustomEmojiPicker/custom_emoji_picker.dart';

class AddCreditAndAdvance extends StatefulWidget {
  const AddCreditAndAdvance({super.key});

  @override
  State<AddCreditAndAdvance> createState() => _AddCreditAndAdvanceState();
}

class _AddCreditAndAdvanceState extends State<AddCreditAndAdvance> with SingleTickerProviderStateMixin {
  TabController? tabController;
  final amountController = TextEditingController();

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
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text('CANCEL',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 19),)
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/FinanceIcon/money-management (4).png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),
            Text('Credits and Advances'.toUpperCase(),style: TextStyle(color: AppColor.kBlack,fontSize: 22,fontWeight: FontWeight.bold),),

            SizedBox(height: 20,),
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
                      width: 40,
                      height: 40,
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
                    width: MediaQuery.of(context).size.width * 0.6,
                    child:  TextField(
                      style: const TextStyle(
                          color: AppColor.kBlack,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      decoration: const InputDecoration(
                          hintText: "NAME OF CREDIT PRODUCT",
                          hintStyle: TextStyle(fontSize: 16)),
                      onChanged: (value){
                        Get.find<EmojiPopUpController>().onChangeGlobleCategories(value);
                      },
                    )),
              ],
            ),

            SizedBox(height: 20,),
            rowTextAmoun("assigned amount","10.000.00","1"),
            SizedBox(height: 10,),
            rowTextAmoun("CURRENT EXPENSE","6.000.00","0"),
            SizedBox(height: 10,),
            rowTextAmoun("assigned amount","10.000.00","1"),
          ],
        ),
      ),
    );
  }
}

rowTextAmoun(text,amount,isIncome){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("$text: ".toUpperCase(),style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 16),),
      Text("\$ $amount",style: TextStyle(color:(isIncome=="1")? AppColor.kGreen:AppColor.kRed,fontWeight: FontWeight.bold,fontSize: 16,decoration: TextDecoration.underline,),)
    ],).marginSymmetric(horizontal: 15);
}
