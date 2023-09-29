import 'package:expense/ui/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Controllers/InitController/InitController.dart';
import 'constants/localization_translator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  ]);
  runApp(const ExpenseApp());
}
class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Geoweb Expense",
      initialBinding: InitController(),
      locale: const Locale('es','US'),
      debugShowCheckedModeBanner: false,
      translations: LocalizationTranslator(),
      home: const SplashScreen(),
    );
  }
}

