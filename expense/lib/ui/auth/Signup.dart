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
                "Join our community 😃",
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
                        labelText: "Name",
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
                        labelText: "Email",
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
                        labelText: "Password",
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
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ).marginOnly(top: 8),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Signup now",
                      style: TextStyle(color: Colors.white),
                    ).marginSymmetric(vertical: 14),
                  ).marginOnly(top: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style: TextStyle(color: Colors.black),
                      ),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text(
                          " Sign in instead",
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
                      Text("or continue with"),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.black,
                      ),
                    ],
                  ).marginOnly(top: 30),
                  SignInButton(
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
