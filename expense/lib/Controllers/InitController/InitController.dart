import 'package:expense/Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../DashBoardController/dashboard_controller.dart';
import '../LocalizationController.dart';

class InitController with Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(Localization(),permanent: true);
    Get.put(EmojiPopUpController(),permanent: true);
    Get.put(DashBoardController(),permanent: true);
    // Get.put(CommonController(),permanent: true);
    // Get.put(AuthenticationController(),permanent: true);


  }

}