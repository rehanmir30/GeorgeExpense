import 'package:expense/AppColors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import '../../../custom_widget/CustomEmojiPicker/custom_emoji_picker.dart';
import '../Calculator Screen/credit_calculator.dart';

class AddNewFundScreen extends StatefulWidget {
  const AddNewFundScreen({super.key});

  @override
  State<AddNewFundScreen> createState() => _AddNewFundScreenState();
}

class _AddNewFundScreenState extends State<AddNewFundScreen> with SingleTickerProviderStateMixin {
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
                InkWell(
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    onTap: (){
                    Get.back();
                    },
                    child:const Text('CANCEL',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),).marginAll(10)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/wallet.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('NEW FUNDS: ',style: TextStyle(color: AppColor.kBlack,fontSize: 18,fontWeight: FontWeight.bold),).marginSymmetric(horizontal: 15)),
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
                    width: MediaQuery.of(context).size.width * 0.5,
                    child:  TextField(
                      style: const TextStyle(
                          color: AppColor.kBlack,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      decoration: const InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(fontSize: 18)),
                      onChanged: (value){
                        Get.find<EmojiPopUpController>().onChangeGlobleCategories(value);
                      },
                    )),
              ],
            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
                height: 40,
                child: rowTextLineWitoutPercent("MONTO ACTUAL:",amountController)),

            SizedBox(height: 40,),
            // Icon(Icons.chat_outlined,size: 60,color: AppColor.kBlack,),

            Image.asset("assets/images/chat.png",width: 50,height: 50,),

            SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.kBlack,width: 2),
                borderRadius: BorderRadius.circular(12),
                color: AppColor.kGrey,
              ),
              child: Text('SAVE',style: TextStyle(color: AppColor.kBlack,fontSize: 16,fontWeight: FontWeight.bold),),
            ).paddingSymmetric(horizontal: 25),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.kBlack,width: 2),
                borderRadius: BorderRadius.circular(12),
                color: AppColor.kRed,
              ),
              child: Text('DELETE',style: TextStyle(color: AppColor.kWhite,fontSize: 16,fontWeight: FontWeight.bold),),
            ).paddingSymmetric(horizontal: 25),



          ],
        ),
      ),
    );
  }
}


Widget rowTextLineWitoutPercent(titleText, controller){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('$titleText',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),
      SizedBox(width: 10,),
      Expanded(child: TextFormField(
        style: TextStyle(color: AppColor.kGreen,fontSize: 18,fontWeight: FontWeight.bold),
        keyboardType: TextInputType.phone,
        controller: controller,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefix: Text('\$ ',style: TextStyle(color: AppColor.kGreen,fontWeight: FontWeight.bold,fontSize: 18),),
        ),
      )),
    ],);
}