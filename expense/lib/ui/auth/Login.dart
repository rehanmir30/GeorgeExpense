import 'package:expense/ui/auth/Signup.dart';
import 'package:expense/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../widgets/background.dart';
import 'ForgotPassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool showPassword = false;
  var passwordVisibilityIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImg(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back 😇",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      ),
                      TextFormField(
                        controller: passController,
                        // cursorColor: AppColors.red,
                        obscureText: !showPassword,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                            enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                ),
                            focusedBorder: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black)),
                      ).marginOnly(top: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Show Password"),
                              Switch(
                                value: showPassword,
                                activeColor: Colors.black,
                                inactiveThumbColor: Colors.grey,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    showPassword = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: (){
                                Get.to(ForgotPassword(),transition: Transition.downToUp);
                              },
                              child: Text("Forgot Password?"))
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Get.offAll(HomeScreen(),transition: Transition.zoom);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ).marginSymmetric(vertical: 14),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New to our community?",
                            style: TextStyle(color: Colors.black),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(SignUpScreen(),transition: Transition.zoom);
                            },
                            child: Text(
                              " Signup now",
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
                  ),
                ),
              ],
            ).marginSymmetric(horizontal: 20, vertical: 10)
          ],
        ),
      ),
    );
  }
}
