import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LocalizationTranslator extends Translations{

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    //ENGLISH LANGUAGE
    'en_US':{
      //AppName
      "GeowebExpense": "Geoweb Expense",

      //Login Screen
      "email":"Email",
      "welcome":"Welcome Back",
      "emailrequired":"Email Required",
      "emailFormaterror":"Invalid email added",
      "password":"Password",
      "passwordrequired":"Password required",
      "passwordLengtherror":"Password should be greater than 6 characters",
      "showPassword":"Show Password",
      "forgotPassword":"Forgot Password",
      "login":"Login",
      "newtoCommunity":"New to our community?",
      "signupNow":" Signup now",
      "continueWith":"or continue with"

    },

    //Spanish LANGUAGE
    'es_US':{
      //AppName
      "GeowebExpense": "Geoweb Expense",

      //Login Screen
      "email":"Correo electrónico",
      "welcome":"Bienvenido de nuevo",
      "emailrequired":"Correo electronico requerido",
      "emailFormaterror":"Se agregó un correo electrónico no válido",
      "password":"Contraseña",
      "passwordrequired":"Se requiere contraseña",
      "passwordLengtherror":"La contraseña debe tener más de 6 caracteres.",
      "showPassword":"Mostrar contraseña",
      "forgotPassword":"Has olvidado tu contraseña",
      "login":"Acceso",
      "newtoCommunity":"Nueva en nuestra comunidad?",
      "signupNow":" Regístrate ahora",
      "continueWith":"o continuar con"
    },

  };




}