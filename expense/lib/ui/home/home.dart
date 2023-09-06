import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(
            Icons.search_rounded,
            color: Colors.black,
          ).marginOnly(right: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/alarm.png",width: 50,height: 50,),
                Image.asset("assets/images/calendar.png",width: 50,height: 50,),
                Image.asset("assets/images/wallet.png",width: 50,height: 50,),
                Image.asset("assets/images/calculator.png",width: 50,height: 50,),
                Image.asset("assets/images/xlsdownload.png",width: 50,height: 50,),

              ],
            ).marginSymmetric(horizontal: 30)
          ],
        ),
      ),
    );
  }
}
