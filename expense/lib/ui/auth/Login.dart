import 'package:expense/Controllers/AuthController/AuthController.dart';
import 'package:expense/ui/auth/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../Controllers/LocalizationController.dart';
import 'package:expense/custom_widget/MyAlertDialog.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundImg(),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "welcome".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    TextFormField(
                      // controller: emailController,
                      // cursorColor: AppColors.red,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                              border: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                          enabledBorder: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                          focusedBorder: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                              errorBorder: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                          labelText: "email".tr,
                          labelStyle: const TextStyle(color: Colors.black)),
                      validator: (email){
                        if(email==null || email.isEmpty){
                          return "emailrequired".tr;
                        }
                        return null;
                      },
                      onChanged: (value){
                        Get.find<AuthController>().onChangeEmail(value);
                      },
                    ),
                    TextFormField(
                      controller: passController,
                      // cursorColor: AppColors.red,
                      obscureText: !showPassword,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          border: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                          enabledBorder: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                          focusedBorder: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                              errorBorder: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              ),
                          labelText: "password".tr,
                          labelStyle: const TextStyle(color: Colors.black)),
                      validator: (password){
                        if(password==null || password.isEmpty){
                          return "passwordrequired".tr;
                        }
                        return null;
                      },
                       onChanged: (value){
                        Get.find<AuthController>().onChangePassword(value);
                      },
                    ).marginOnly(top: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("showPassword".tr),
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
                              Get.to(const ForgotPassword(),transition: Transition.downToUp);
                            },
                            child: Text("forgotPassword".tr,softWrap: true,))
                      ],
                    ),
                    InkWell(
                      onTap: ()async{
                        if(_formKey.currentState!.validate()){
                          Get.find<AuthController>().SignIn();
                        }
                          
                        // Get.offAll(const HomeScreen(),transition: Transition.zoom);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "login".tr,
                          style: const TextStyle(color: Colors.white),
                        ).marginSymmetric(vertical: 14),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "newtoCommunity".tr,
                          style: const TextStyle(color: Colors.black),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(const SignUpScreen(),transition: Transition.zoom);
                          },
                          child: Text(
                            "signupNow".tr,
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
                    ).marginOnly(top: 30),
                          
                    GetBuilder<Localization>(builder: (controller) {
                      return InkWell(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const MyAlertDialog();
                              },
                            );
                          },
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(controller.dropdownValue['name'].toString(),style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),const Icon(Icons.arrow_drop_down_sharp,color: Colors.black,size: 50,)],));
                    },),
                          
                          
                  ],
                ).marginSymmetric(horizontal: 20, vertical: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
