import 'package:expense/ui/auth/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isVisible = false;


  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isVisible = true;
      });
    });
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAll(LoginScreen(),transition: Transition.zoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
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
                    duration: Duration(seconds: 1),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo_black.png"),
                      ),
                    ),
                  )),
              // SizedBox(height: 20,),
              Container(
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
