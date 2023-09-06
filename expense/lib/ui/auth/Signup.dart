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

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();

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
      body: Stack(
        children: [
          BackgroundImg(),
          Column(
            children: [
              Text(
                "joinOurCommunity".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Expanded(child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    // cursorColor: AppColors.red,
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "name".tr,
                        labelStyle: TextStyle(color: Colors.black)),
                  ).marginOnly(top: 12),
                  TextFormField(
                    controller: emailController,
                    // cursorColor: AppColors.red,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "email".tr,
                        labelStyle: TextStyle(color: Colors.black)),
                  ).marginOnly(top: 8),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    // cursorColor: AppColors.red,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "password".tr,
                        labelStyle: TextStyle(color: Colors.black)),
                  ).marginOnly(top: 8),
                  TextFormField(
                    controller: cPassController,
                    obscureText: true,
                    // cursorColor: AppColors.red,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                        ),
                        labelText: "confirmPassword".tr,
                        labelStyle: TextStyle(color: Colors.black)),
                  ).marginOnly(top: 8),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "signupNow".tr,
                      style: TextStyle(color: Colors.white),
                    ).marginSymmetric(vertical: 14),
                  ).marginOnly(top: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "alreadyAMember".tr,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text(
                          "SignInInstead".tr,
                          style: TextStyle(
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
              ))
            ],
          ).marginSymmetric(horizontal: 20,vertical: 12)
        ],
      ),
    );
  }
}
