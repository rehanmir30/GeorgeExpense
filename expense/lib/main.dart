import 'package:expense/ui/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Controllers/InitController/InitController.dart';
import 'constants/LocalizationTranslator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      locale: Locale('es','US'),
      debugShowCheckedModeBanner: false,
      translations: LocalizationTranslator(),
      home: SplashScreen(),
    );
  }
}

