import 'package:expense/DB/DatabaseHelper.dart';
import 'package:expense/Models/user_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController{

  UserModel? _userModel;
  UserModel? get userModel=>_userModel;

   String? name;
   String? email;
   String? password;
   String? confirm_password;

   onChangeName(String? enteredName)async{
    name = enteredName;
    update();
   }

   onChangeEmail(String? enteredEmail)async{
    email = enteredEmail;
    update();
   }

   onChangePassword(String? EnteredPassword)async{
    password = EnteredPassword;
    update();
   }

   onChangeConfirmPassword(String? EnteredConfirmPassword)async{
    confirm_password = EnteredConfirmPassword;
    update();
   }

  setUserData(UserModel? model)async{
    _userModel = model;
    update();
  }

  SignUp()async{
    await DatabaseHelper().SignUp();
    update();
  }

  SignIn()async{
    await DatabaseHelper().SignIn();
    update();
  }


  ClearFields()async{
    name=null;
    email=null;
    password=null;
    confirm_password=null;
    update();
  }
  
}