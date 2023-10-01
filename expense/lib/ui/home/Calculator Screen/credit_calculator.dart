import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../AppColors/colors.dart';


class CreditCalculator extends StatefulWidget {
  const CreditCalculator({super.key});

  @override
  State<CreditCalculator> createState() => _CreditCalculatorState();
}

class _CreditCalculatorState extends State<CreditCalculator> {
  final monthlyInterestController = TextEditingController();
  final monthsController = TextEditingController();
  final extraChargesController = TextEditingController();
  final installmentAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left,color: AppColor.primaryColor,size: 28,),
          onPressed: () {
            Get.back();
          },),
        title: Text('Credit Calculator',style: TextStyle(color: AppColor.primaryColor),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Loan Amount',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),
                  TextFormField(
                    style: TextStyle(color: AppColor.kBlack),
                    decoration: InputDecoration(
                      prefix: Text('\$ ',style: TextStyle(color: AppColor.kGrey,fontWeight: FontWeight.bold),),

                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: false),
                  ),
                  SizedBox(height: 10,),
                  Text('Loan APR',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),

                  Container(
                    height: 30,
                      child: rowTextLine("Monthly",monthlyInterestController)),
                  SizedBox(height: 10,),
                  SizedBox(height: 10,),
                  Text('Loan Terms',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 18),),

                  Container(
                    height: 30,
                    child: rowTextLine("Months", monthsController),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 30,
                      child: rowTextLine("Extra Charges", extraChargesController),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: 30,
                      child: rowTextLine("Installment Amount:", installmentAmountController),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.kRed.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(13)
                  ),child: Text('Amortization Table',style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 1.0,color: AppColor.kWhite,fontSize: 18),),),
                ],),
            ),
          ],
        ),
      ),

    );
  }
}

Widget rowTextLine(titleText, controller){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('$titleText',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.normal,fontSize: 18),),
      SizedBox(width: 10,),
      Expanded(child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          suffixIcon: Icon(Icons.percent,color: AppColor.kGrey,),
        ),
      )),
    ],);
}