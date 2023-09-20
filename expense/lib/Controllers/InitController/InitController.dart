import 'package:expense/Controllers/AuthController/AuthController.dart';
import 'package:expense/Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import 'package:expense/Controllers/sqlController/SqlController.dart';
import 'package:get/get.dart';

import '../DashBoardController/dashboard_controller.dart';
import '../LocalizationController.dart';

class InitController with Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(Localization(),permanent: true);
    Get.put(EmojiPopUpController(),permanent: true);
    Get.put(DashBoardController(),permanent: true);
    Get.put(AuthController(),permanent: true);
    Get.put(SqlController(),permanent: true);
    // Get.put(CommonController(),permanent: true);
    // Get.put(AuthenticationController(),permanent: true);


  }

}