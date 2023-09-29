import 'package:expense/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
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
        body: SafeArea(
          child: Stack(
      children: [
          const BackgroundImg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                 "Whoops 😯",
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
               ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text("Forgot your password? Don't worry. We got you",style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),)).marginOnly(top: 30),
                    const Text("Provide us with your email, we'll send you an email with reset password link.").marginOnly(top: 12),
                    TextFormField(
                      controller: emailController,
                      // cursorColor: AppColors.red,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
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
                    ).marginOnly(top: 20),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Send Email",
                        style: TextStyle(color: Colors.white),
                      ).marginSymmetric(vertical: 14),
                    ).marginOnly(top: 20),

                  ],
                ),
              ),
            ],
          ).marginSymmetric(horizontal: 20,vertical: 10)
      ],
    ),
        ));
  }
}
