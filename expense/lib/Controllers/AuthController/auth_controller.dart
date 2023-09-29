import 'package:expense/DB/DatabaseHelper.dart';
import 'package:expense/Models/user_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController{

  UserModel? _userModel;
  UserModel? get userModel=>_userModel;

   String? name;
   String? email;
   String? password;
   String? confirmPassword;

   onChangeName(String? enteredName)async{
    name = enteredName;
    update();
   }

   onChangeEmail(String? enteredEmail)async{
    email = enteredEmail;
    update();
   }

   onChangePassword(String? enteredPassword)async{
    password = enteredPassword;
    update();
   }

   onChangeConfirmPassword(String? enteredConfirmPassword)async{
    confirmPassword = enteredConfirmPassword;
    update();
   }

  setUserData(UserModel? model)async{
    _userModel = model;
    update();
  }

  signUp()async{
    await DatabaseHelper().signUp();
    update();
  }

  signIn()async{
    await DatabaseHelper().SignIn();
    update();
  }


  clearFields()async{
    name=null;
    email=null;
    password=null;
    confirmPassword=null;
    update();
  }
  
}