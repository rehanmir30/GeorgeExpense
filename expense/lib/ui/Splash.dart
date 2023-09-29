import 'package:expense/Controllers/AuthController/auth_controller.dart';
import 'package:expense/DB/SharedPreference/SharedPref.dart';
import 'package:expense/Models/user_model.dart';
import 'package:expense/ui/auth/login.dart';
import 'package:expense/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isVisible = false;

 @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isVisible = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 3000), () async {
      AuthController commonController = Get.find<AuthController>();
      UserModel? savedUser = await SharedPref.getUser();
      if (savedUser != null) {

        await commonController.setUserData(savedUser);
        Get.offAll(()=>  const HomeScreen());
      }else{
        Get.offAll(const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                  child: AnimatedContainer(
                    width: _isVisible ? 150 : 0,
                    height: _isVisible ? 150 : 0,
                    curve: Curves.bounceIn,
                    duration: const Duration(seconds: 1),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo_black.png"),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),
              const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  color: Colors.black38,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
