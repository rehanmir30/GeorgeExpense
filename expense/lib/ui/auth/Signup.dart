import 'package:expense/Controllers/AuthController/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../widgets/background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // TextEditingController emailController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passController = TextEditingController();
  // TextEditingController cPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            const BackgroundImg(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "joinOurCommunity".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  TextFormField(
                    initialValue: Get.find<AuthController>().name??"",
                    // controller: nameController,
                    // cursorColor: AppColors.red,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        errorBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                         border: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "name".tr,
                        labelStyle: const TextStyle(color: Colors.black)),
                        validator: (value) {
                          if(value==null || value==""){
                            return "Name Required";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Get.find<AuthController>().onChangeName(value);
                        },
                  ).marginOnly(top: 12),
                  TextFormField(
                    // controller: emailController,
                    // cursorColor: AppColors.red,
                    initialValue: Get.find<AuthController>().email??"",
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        errorBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                         border: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "email".tr,
                        labelStyle: const TextStyle(color: Colors.black)),
                        validator: (value){
                            if(value==null || value==""){
                            return "Email Required";
                          }
                            return null;
                        },
                        onChanged: (value){
                  
                          Get.find<AuthController>().onChangeEmail(value);
                        
                        },
                  ).marginOnly(top: 8),
                  TextFormField(
                    initialValue: Get.find<AuthController>().password??"",
                    // controller: passController,
                    obscureText: true,
                    // cursorColor: AppColors.red,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        errorBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                         border: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "password".tr,
                        labelStyle: const TextStyle(color: Colors.black)),
                  
                         validator: (value){
                            if(value==null || value==""){
                            return "Password Required";
                          }
                          if(value.length<6){
                            return "Password Should be at 6 characters";
                          }
                            return null;
                        },
                        onChanged: (value){
                  
                          Get.find<AuthController>().onChangePassword(value);
                        
                        },
                  
                  
                  ).marginOnly(top: 8),
                  TextFormField(
                    initialValue: Get.find<AuthController>().confirm_password??"",
                    obscureText: true,
                    // cursorColor: AppColors.red,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        errorBorder: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        border: const OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "confirmPassword".tr,
                        labelStyle: const TextStyle(color: Colors.black)),
                        validator: (value){
                            if(value==null || value==""){
                            return "Confirm Password Required";
                          }
                          if(value != Get.find<AuthController>().password){
                            return "Confirm password doesn't match";
                          }
                            return null;
                        },
                        onChanged: (value){
                  
                          Get.find<AuthController>().onChangeConfirmPassword(value);
                        
                        },
                  ).marginOnly(top: 8),
                  InkWell(
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        print("tapped");
                        Get.find<AuthController>().SignUp();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "signupNow".tr,
                        style: const TextStyle(color: Colors.white),
                      ).marginSymmetric(vertical: 14),
                    ).marginOnly(top: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "alreadyAMember".tr,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text(
                          "SignInInstead".tr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ).marginOnly(top: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.black,
                      ),
                      Text("continueWith".tr),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.black,
                      ),
                    ],
                  ).marginOnly(top: 30),
                  SignInButton(
                    text: "googleSignIn".tr,
                    Buttons.Google,
                    onPressed: () {},
                  ).marginOnly(top: 30)
                ],
              ).marginSymmetric(horizontal: 20,vertical: 12),
            )
          ],
        ),
      ),
    );
  }
}
