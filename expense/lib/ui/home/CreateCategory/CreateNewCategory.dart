import 'package:expense/AppColors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class CreateNewCategory extends StatefulWidget {
  const CreateNewCategory({super.key});

  @override
  State<CreateNewCategory> createState() => _CreateNewCategoryState();
}

class _CreateNewCategoryState extends State<CreateNewCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,color: AppColor.primaryColor,)),
        backgroundColor: AppColor.kWhite,
        elevation: 0,
      ),
      backgroundColor: AppColor.kWhite,
      body: Column(
        children: [

          const SizedBox(height: 20,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
            Container(
              width: 60,height: 60,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.kBlack,width: 1),
              ),
              child: Image.asset("assets/images/addIcon.png",fit: BoxFit.fill,),
            ),

              const SizedBox(width: 40,),

              Container(
                height: 50,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: const TextField(
                    style: TextStyle(color: AppColor.kBlack,letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 25),
                    decoration: InputDecoration(
                      hintText: "Enter Category Name",
                      hintStyle: TextStyle(fontSize: 18)
                    ),
                  )),
            
          ],),

          SizedBox(height: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Single",style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 20),).marginOnly(right: 5),
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
                }, onTap: (){

              }, onDoubleTap: (){}, onSwipe: (){

              },
              ),
              Text("Sublevels",style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 20),).marginOnly(left: 5),
            ],
          ),
          SizedBox(height: 40,),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.kGrey,
              border: Border.all(width: 2,color: AppColor.kBlack),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('CANCEL',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 24,letterSpacing: 1),),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.kYellow,
              border: Border.all(width: 2,color: AppColor.kBlack),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('SAVE',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 24,letterSpacing: 1),),
          ),
        ],
      ),
    );
  }
}
