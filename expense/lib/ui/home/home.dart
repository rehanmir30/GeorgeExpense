import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import '../../custom_widget/CustomEmojiPicker/custom_emoji_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController? tabController ;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: (){

            },
            child: Icon(
              Icons.search_rounded,
              color: Colors.black,
            ).marginOnly(right: 10),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/alarm.png",width: 50,height: 50,),
                Image.asset("assets/images/calendar.png",width: 50,height: 50,),
                Image.asset("assets/images/wallet.png",width: 50,height: 50,),
                Image.asset("assets/images/calculator.png",width: 50,height: 50,),
                Image.asset("assets/images/xlsdownload.png",width: 50,height: 50,),

              ],
            ).marginSymmetric(horizontal: 30)
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context) {
          return  EmojiTabController(
              tabController: tabController,
              AnimalEmoji: Get.find<EmojiPopUpController>().AnimalEmoji,
              BabyEmoji: Get.find<EmojiPopUpController>().BabyEmoji,
              BusinessEmoji: Get.find<EmojiPopUpController>().BusinessEmoji,
              CarEmoji: Get.find<EmojiPopUpController>().CarEmoji,
              EntertainmentEmoji: Get.find<EmojiPopUpController>().EntertainmentEmoji,
              FamilyEmoji: Get.find<EmojiPopUpController>().FamilyEmoji,
              FinanceEmoji: Get.find<EmojiPopUpController>().FinanceEmoji,
              FoodAndDrinksEmoji: Get.find<EmojiPopUpController>().FoodAndDrinksEmoji,
              GymEmoji: Get.find<EmojiPopUpController>().GymEmoji,
              HealthCareEmoji: Get.find<EmojiPopUpController>().HealthCareEmoji,
              HomeEmoji: Get.find<EmojiPopUpController>().HomeEmoji,
              ITComputerIEmoji: Get.find<EmojiPopUpController>().ITComputerIEmoji,
              MakupEmoji: Get.find<EmojiPopUpController>().MakupEmoji,
              RestaurantEmoji: Get.find<EmojiPopUpController>().RestaurantEmoji,
              RopaClothingEmoji: Get.find<EmojiPopUpController>().RopaClothingEmoji,
              ServicesEmoji: Get.find<EmojiPopUpController>().ServicesEmoji,
              ShoppingEmoji: Get.find<EmojiPopUpController>().ShoppingEmoji,
              SportsEmoji: Get.find<EmojiPopUpController>().SportsEmoji,
              StatisticsEmoji: Get.find<EmojiPopUpController>().StatisticsEmoji,
              StudiesEducationEmoji: Get.find<EmojiPopUpController>().StudiesEducationEmoji,
              SubscriptionEmoji: Get.find<EmojiPopUpController>().SubscriptionEmoji,
              TransportEmoji: Get.find<EmojiPopUpController>().TransportEmoji,
              UsersEmoji: Get.find<EmojiPopUpController>().UsersEmoji,
              VacationEmoji: Get.find<EmojiPopUpController>().VacationEmoji);
        },);
      },child: Icon(Icons.add),),
    );
  }
}
