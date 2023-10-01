import 'package:expense/ui/home/Funds%20Screen/add_new_fund_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../AppColors/colors.dart';

class AvailableFundsScreen extends StatefulWidget {
  const AvailableFundsScreen({super.key});

  @override
  State<AvailableFundsScreen> createState() => _AvailableFundsScreenState();
}

class _AvailableFundsScreenState extends State<AvailableFundsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: InkWell(
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
              ),

              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/wallet.png",
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(height: 10,),
              Align(
                  alignment: Alignment.center,
                  child: Text('Available Funds'.toUpperCase(),style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 21),)),

              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:  [
                          Text('Efectivo',style:TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 21)),
                          Text('\$ 800.00',style:TextStyle(color: AppColor.kGreen,fontWeight: FontWeight.normal,fontSize: 18)),
                        ],
                      ),
                    ),
                  ],),
              ),

              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [

                InkWell(
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  onTap:(){
                    Get.to(()=>const AddNewFundScreen());



                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColor.kOrange,
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.add,color: AppColor.kWhite,size: 40,fill: 1.0,),
                  ),
                ),
              SizedBox(height: 10,),
              Text('ADD FUNDS',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),
              Text('(Savings accounts, electronic wallets, etc.)',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.normal,fontSize: 16),),

              SizedBox(height: 30,),

              Text('Note: Credits and advances\nshould not be created here',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
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

                ],),
              )

            ],
          ),
        ),
      ),
    );
  }
}
