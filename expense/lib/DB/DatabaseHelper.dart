import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense/Controllers/AuthController/AuthController.dart';
import 'package:expense/DB/SharedPreference/SharedPref.dart';
import 'package:expense/ui/home/home.dart';
import 'package:expense/widgets/CustomSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../AppColors/colors.dart';
import '../Models/user_model.dart';


class DatabaseHelper{


Future<void> SignUp()async{
    try {

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: Get.find<AuthController>().email??"", password: Get.find<AuthController>().password??"");
     
      var userid = userCredential.user!.uid;
      UserModel userModel = UserModel(
        id: userid,
        name: Get.find<AuthController>().name,
        email: Get.find<AuthController>().email,
        createdAt: DateTime.now(),
        logout: false,
        updatedAt: DateTime.now()
      );
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userModel.id)
          .set(userModel.toMap());

      CustomSnackbar.show("Sign Up Successful", AppColor.kBlack);
      Get.find<AuthController>().ClearFields();

      await Get.find<AuthController>().setUserData(userModel);
      await SharedPref.saveUser(userModel);
      Get.to(const HomeScreen(), transition: Transition.downToUp);
    } on FirebaseAuthException catch (error) {
      CustomSnackbar.show("${error.message}", AppColor.kRed);
    }
}


 //Login Function
  Future SignIn() async {
    AuthController authController = Get.find<AuthController>();
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: Get.find<AuthController>().email??"", password: Get.find<AuthController>().password??"");
      User? user = userCredential.user;

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .get()
          .then((value) async {
        UserModel myUser = UserModel.fromMap(value.data()!);
        await authController.setUserData(myUser);
        CustomSnackbar.show("Login Successful", AppColor.kBlack);
        await authController.setUserData(myUser);
        await SharedPref.saveUser(myUser);
        Get.offAll(const HomeScreen(), transition: Transition.downToUp);
      });
    } on FirebaseAuthException catch (error) {
      CustomSnackbar.show("${error.message}", AppColor.kRed);
    }
  }

}