import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


import '../../../AppColors/colors.dart';

class LastTrsnsactionDetail extends StatelessWidget {
  const LastTrsnsactionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: AppColor.kBlack,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: AppColor.kWhite,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColor.kBlack,
                    size: 34,
                  ))
            ],
          ).marginSymmetric(horizontal: 15),

           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text("",style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 20),).marginOnly(right: 5),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Last",
                    style: TextStyle(
                        color: AppColor.kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ).marginOnly(right: 5),
                  LiteRollingSwitch(
                    width: 100,
                    //initial value
                    value: true,
                    textOn: '',
                    textOff: '',
                    colorOn: AppColor.kGreen,
                    colorOff: AppColor.kGrey,
                    iconOn: Icons.done,
                    iconOff: Icons.done,
                    textSize: 16.0,
                    onChanged: (bool state) {
                      //Use it to manage the different states
                      print('Current State of SWITCH IS: $state');
                    },
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                        color: AppColor.kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ).marginOnly(left: 5),
                ],
              ),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: AppColor.kGrey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.kBlack, width: 2)),
                child: const Text(
                  'TODAY',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ).marginSymmetric(horizontal: 5),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: AppColor.kGrey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.kBlack, width: 2)),
                child: const Text(
                  '7D',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ).marginSymmetric(horizontal: 5),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: AppColor.kGrey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.kBlack, width: 2)),
                child: const Text(
                  'Mon',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ).marginSymmetric(horizontal: 5),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: AppColor.kGrey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.kBlack, width: 2)),
                child: const Text(
                  'PERS.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ).marginSymmetric(horizontal: 5),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                    // color: AppColor.kGrey.withOpacity(0.6),
                    // borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: AppColor.kBlack, width: 2)
                    ),
                child: Image.asset(
                  "assets/images/FinanceIcon/matematicas.png",
                  width: 40,
                  height: 40,
                ),
              ).marginSymmetric(horizontal: 5),
            ],
          ).marginSymmetric(horizontal: 15),
          const SizedBox(
            height: 20,
          ),
          

          Row(
            children: [
              const SizedBox(width: 15,),
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: AppColor.kBlack,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.kWhite,
                ),
              ),
              const SizedBox(width: 10,),Text("Last Transactions:",style:TextStyle(color: AppColor.kBlack,fontSize: 24,fontWeight: FontWeight.bold))
            ],
          ),

          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 5),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text('Hotdog',style:TextStyle(color: AppColor.kGrey.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 21)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('\$ 6.000',style:TextStyle(color: AppColor.kRed,fontWeight: FontWeight.bold,fontSize: 21)),
                    Text('Holy',style:TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 21)),

                  ],
                ),
          
              ],);
            },),
          ),

          const SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            width: MediaQuery.of(context).size.width*0.5,
            decoration: BoxDecoration(
              color: AppColor.kGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: AppColor.kBlack,)
            ),

            child: const Text('SEE ALL',style:TextStyle(color: AppColor.kBlack,fontSize: 21,fontWeight: FontWeight.bold)),
          ),

        ]),
      ),
    );
  }
}
