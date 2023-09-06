import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controllers/LocalizationController.dart';



class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({super.key});

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  String selectedOption = Get.find<Localization>().dropdownValue["name"];
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          RadioListTile(
            activeColor: Colors.black,
            title: Text('English'),
            value: 'English',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
          RadioListTile(
            activeColor: Colors.black,
            title: Text('Spanish'),
            value: 'Spanish',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ],
      ),
      actions: [

        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white,elevation: 0),
          child: Text('CANCEL',style: TextStyle(color: Colors.black),),
          onPressed: () {
            Navigator.of(context).pop(selectedOption);
          },
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white,elevation: 0),
          child: Text('OK',style: TextStyle(color: Colors.black)),
          onPressed: () {
            Localization loacl = Get.find<Localization>();
            loacl.setSelectedLang(selectedOption);

            // Get.put(OnBoardingController());
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}