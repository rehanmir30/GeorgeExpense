import 'package:expense/AppColors/colors.dart';
import 'package:expense/ui/home/Credit%20And%20Advances/add_credit_and_advance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditAndAdvances extends StatefulWidget {
  const CreditAndAdvances({super.key});

  @override
  State<CreditAndAdvances> createState() => _CreditAndAdvancesState();
}

class _CreditAndAdvancesState extends State<CreditAndAdvances> {
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

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap:(){
                      Get.to(()=>const AddCreditAndAdvance());
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.kOrange
                      ),
                      child: Icon(Icons.add,size: 40,color: AppColor.kWhite,),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Text('ADD CREDIT OR ADVANCE',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),
                  Text(' (Credit cards, revolving, unrestrictedinvestment, advances, etc.)',style: TextStyle(color: AppColor.kBlack,fontSize: 16),textAlign: TextAlign.center,).marginSymmetric(horizontal: 25),

                SizedBox(height: 100,),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
