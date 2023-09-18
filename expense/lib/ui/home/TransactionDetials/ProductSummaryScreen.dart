import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../AppColors/colors.dart';

class ProductSummaryScreen extends StatefulWidget {
  const ProductSummaryScreen({super.key});

  @override
  State<ProductSummaryScreen> createState() => _ProductSummaryScreenState();
}

class _ProductSummaryScreenState extends State<ProductSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: SafeArea(
  child: Column(
    children: [

      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: AppColor.kBlack,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.keyboard_arrow_left_outlined,color: AppColor.kWhite,),
                    ),
        ),

                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.kBlack, width: 2,),
                      color: AppColor.kGrey.withOpacity(0.6)
                    ),
                    child: const Text('EDIT',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  )

      ],).marginSymmetric(horizontal: 15),

      const Text("PRODUCTS SUMMARY:",style:TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize:23)),

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
                      'MO',
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
                      'CUST.',
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



              const SizedBox(height: 20,),

              ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Row(
                  children: [
                    Image.asset((index%2==0)?"assets/images/FinanceIcon/01.png":"assets/images/FinanceIcon/aplicacion-wallet-pass (1).png",width: 50,height: 50,),
                    const SizedBox(width: 10,),
                     Text((index%2==0)?'Cash':"DaviPlata",style:const TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: AppColor.kBlack)),
                  ],
                ),

                const Text('\$800.000',style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: AppColor.kRed))



              ],).marginSymmetric(horizontal: 15,vertical: 2);
              
            },),

            Container(
                    padding: const EdgeInsets.all(15),
                    // width: 100,
                    // height: 100,
                    decoration: BoxDecoration(
                      // color: AppColor.kRed,
                      shape:BoxShape.circle,
                      // borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.kWhite,width: 0),
                    ),
                    child: InkWell(
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        onTap: (){
                   
                          // Get.to(()=>const CreateCategoryScreen());
                     
                        },
                        child: Image.asset("assets/images/addIcon.png",width: 100,height: 100,)),
                  ).marginAll(10),

                  const Text('ADD A PRODUCT TO THE LIST',style:TextStyle(color: AppColor.kBlack,fontSize: 23,fontWeight: FontWeight.bold)),

    ]),
),
    );
  }
}