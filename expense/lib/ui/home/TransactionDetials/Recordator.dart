import 'package:expense/AppColors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class RecordatorPage extends StatefulWidget {
  const RecordatorPage({super.key});

  @override
  State<RecordatorPage> createState() => _RecordatorPageState();
}

class _RecordatorPageState extends State<RecordatorPage> {

    var _selectedDay;
  var _focusedDay = DateTime.now();
  var _calendarFormat =  CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Text("CANCEL",style: TextStyle(color: AppColor.kBlack,fontSize: 18,fontWeight: FontWeight.bold),)),
                       IconButton(
                        onPressed: (){
                
              }, icon: const Icon(Icons.search,color: AppColor.kBlack,size: 34,))
        
              ],).marginSymmetric(horizontal: 10),
        
              Image.asset("assets/images/alarm.png",width: 70,height: 70,),
        
              const SizedBox(height: 10,),
        
              TableCalendar(
                 
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
        
                const SizedBox(height: 10,),
        
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('UPCOMMING',style: TextStyle(color: AppColor.kRed,fontSize: 23,fontWeight: FontWeight.bold))).marginSymmetric(horizontal: 17),
        
        
                    ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 7,
                itemBuilder: (context, index) {
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
        
                  const Text('13Jun-24jun',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),).marginOnly(right: 10),
          
                  Row(
                    children: [
                      Container(width: 10,height: 10,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.kBlack)).marginOnly(right: 10),
                               Text('Light',style: TextStyle(fontSize: 23,color: AppColor.kGrey.withOpacity(0.7),fontWeight: FontWeight.bold))
                    ],
                  ),
        
                  const Text('\$150.000',style:TextStyle(color: AppColor.kRed,fontSize: 23,fontWeight: FontWeight.bold)),
                ],).marginSymmetric(horizontal: 15);
              },).marginSymmetric(vertical: 10),


              Container(
                    padding: const EdgeInsets.all(15),
                    // width: 100,
                    // height: 100,
                    decoration: BoxDecoration(
                      // color: AppColor.kRed,
                      shape:BoxShape.circle,
                      // borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.kWhite,width: 0),
                    ),
                    child: InkWell(
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        onTap: (){
                   
                          // Get.to(()=>const CreateCategoryScreen());
                     
                        },
                        child: Image.asset("assets/images/addIcon.png",width: 100,height: 100,)),
                  ).marginAll(10),

                  const Text('CREATE RECORD',style:TextStyle(color: AppColor.kBlack,fontSize: 23,fontWeight: FontWeight.bold)),
        
            ],),
        ),
      ),

    );
  }
}