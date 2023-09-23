import 'package:expense/Controllers/DataController/DataController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../AppColors/colors.dart';
import '../../../Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import '../../../Models/TransactionEntryListModel.dart';
import '../../../Models/category.dart';
import 'package:intl/intl.dart';

import '../../../custom_widget/CustomEmojiPicker/custom_emoji_picker.dart';

class CategoryTransactionScreen extends StatefulWidget {
  final CategoryModel? categoryModel;
  const CategoryTransactionScreen({this.categoryModel,super.key});

  @override
  State<CategoryTransactionScreen> createState() => _CategoryTransactionScreenState();
}

class _CategoryTransactionScreenState extends State<CategoryTransactionScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;
  String? selected_image;
  List <TransactionEntryListModel>? transactionEntryList=[];


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
    DateTime? selectedDate;
    TimeOfDay? timeOfDay;
    bool isIncome= true;

    return GetBuilder<DataController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColor.kWhite,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios,color: AppColor.primaryColor,)),
          backgroundColor: AppColor.kWhite,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
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
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: ()async{

                         selectedDate= await controller.selectDate(context);
                          controller.updateUI();
                        },
                        child: Text(
                            "${DateFormat('dd MMMM yyy').format(selectedDate??DateTime.now())}",style: TextStyle(color: AppColor.kGreen,fontSize: 20),)),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () async {
                        timeOfDay = await controller.selectTime(context);
                        controller.updateUI();
                      },
                      child: Text(
                        (timeOfDay != null ? timeOfDay?.format(context) : TimeOfDay.now().format(context)) ?? '',
                        style: TextStyle(color: AppColor.kGreen, fontSize: 20),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "SPENSE",
                      style: TextStyle(
                          color: AppColor.kBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ).marginOnly(right: 5),
                    LiteRollingSwitch(
                      width: 100,
                      //initial value
                      value: isIncome,
                      textOn: '',
                      textOff: '',
                      colorOn: AppColor.kGreen,
                      colorOff: AppColor.kGreen,
                      iconOn: Icons.arrow_forward_ios,
                      iconOff: Icons.arrow_back_ios_new,
                      textSize: 16.0,
                      onChanged: (bool state) {

                        isIncome=state;
                        controller.updateUI();

                        //Use it to manage the different states
                        print('Current State of SWITCH IS: $state');
                      },
                      onTap: () {
                        isIncome=!isIncome;
                        controller.updateUI();


                      },
                      onDoubleTap: () {},
                      onSwipe: () {},
                    ),
                    const Text(
                      "INCOME",
                      style: TextStyle(
                          color: AppColor.kBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ).marginOnly(left: 5),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.kBlack,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.keyboard_arrow_down_outlined,color: AppColor.kWhite,),
                    ),
                    SizedBox(width: 10,),

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
                              width: 50,
                              height: 50,
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
                          width: 20,
                        ),
                        SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child:  TextField(
                              style: const TextStyle(
                                  color: AppColor.kBlack,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              decoration: const InputDecoration(
                                  hintText: "Enter Resource Name",
                                  hintStyle: TextStyle(fontSize: 15)),
                              onChanged: (value){
                                Get.find<EmojiPopUpController>().onChangeGlobleCategories(value);
                              },
                            )),
                      ],
                    ),

                  ],),

                SizedBox(height: 40,),


                (transactionEntryList==null || (transactionEntryList?.isEmpty??true ))
                    ?Center(child: TextButton(
                    onPressed: (){
                      transactionEntryList?.add(TransactionEntryListModel(sourceName: "",sourceAmount: "",isIncome: isIncome));
                      controller.updateUI();
                    },
                    child: Text('Add Transactions')))
                    :Column(
                  mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.separated(
                  shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                  return SizedBox(
                          height: 40,
                          child: Row(children: [

                            Expanded(child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Resource",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                            )),
                            Expanded(child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter Amount",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                            )),
                          ],));
                }, separatorBuilder: (context, index) {
                  return Divider(thickness: 1,color: AppColor.kGrey,);
                }, itemCount: transactionEntryList?.length??0),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Amount:',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),
                            Text('1000000',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),
                          ],),

                      ],
                    )

              ]).marginSymmetric(horizontal: 15),
        ),
           floatingActionButton: ((transactionEntryList?.isEmpty??true))
               ?SizedBox.shrink()
               :FloatingActionButton.extended(
          backgroundColor: AppColor.kBlack,
            onPressed: (){
          transactionEntryList?.add(TransactionEntryListModel(sourceName: "",sourceAmount: ""));
          controller.updateUI();
        }, label: Text('+ Add Transaction')),
      );
    },);
  }
}
