import 'package:expense/AppColors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:table_calendar/table_calendar.dart';



class Item {
  final String title;
  final String?image;
  final String? price;
  final List<Item> children;

 const Item({required this.title,required this.image, this.price, this.children= const []});
}


class TopMonthExpenses extends StatefulWidget {
  const TopMonthExpenses({super.key});

  @override
  State<TopMonthExpenses> createState() => _TopMonthExpensesState();
}

class _TopMonthExpensesState extends State<TopMonthExpenses> {
  var _selectedDay;
  var _focusedDay = DateTime.now();
  var _calendarFormat =  CalendarFormat.month;

List<Item> ItemsList =[
const Item(
  title: "Fuites",
  image: "assets/images/wallet.png",
  price: "\$20000",
children: [
  Item(title: "Apple",
  image: "assets/images/wallet.png",
  price: "\$18000",
  children: [  Item(title: "apple",image: "assets/images/wallet.png",price: '20000'),  Item(title: "apple",image: "assets/images/wallet.png"),]),
    Item(title: "mango",image: "assets/images/wallet.png"),
      Item(title: "orange",image: "assets/images/wallet.png",price: '20000'),
        Item(title: "banana",image: "assets/images/wallet.png",price: '20000'),
          Item(title: "graps",image: "assets/images/wallet.png",price: '20000'),
          
  ]
),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.kWhite,
          leading: IconButton(onPressed: (){
            Get.back();

          }, icon: const Icon(Icons.arrow_back_ios_new,color: AppColor.kBlack,)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text("",style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 20),).marginOnly(right: 5),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Last",
                    style: TextStyle(
                        color: AppColor.kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ).marginOnly(right: 5),
                  LiteRollingSwitch(
                    width: 100,
                    //initial value
                    value: true,
                    textOn: '',
                    textOff: '',
                    colorOn: AppColor.kGreen,
                    colorOff: AppColor.kGrey,
                    iconOn: Icons.done,
                    iconOff: Icons.done,
                    textSize: 16.0,
                    onChanged: (bool state) {
                      //Use it to manage the different states
                      print('Current State of SWITCH IS: $state');
                    },
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                        color: AppColor.kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ).marginOnly(left: 5),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColor.kGrey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.kBlack, width: 2)),
                    child: const Text(
                      'HOY',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ).marginSymmetric(horizontal: 5),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColor.kGrey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.kBlack, width: 2)),
                    child: const Text(
                      '7D',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ).marginSymmetric(horizontal: 5),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColor.kGrey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.kBlack, width: 2)),
                    child: const Text(
                      'MES',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ).marginSymmetric(horizontal: 5),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColor.kGrey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.kBlack, width: 2)),
                    child: const Text(
                      'PERS.',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ).marginSymmetric(horizontal: 5),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        // color: AppColor.kGrey.withOpacity(0.6),
                        // borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: AppColor.kBlack, width: 2)
                        ),
                    child: Image.asset(
                      "assets/images/FinanceIcon/matematicas.png",
                      width: 40,
                      height: 40,
                    ),
                  ).marginSymmetric(horizontal: 5),
                ],
              ).marginSymmetric(horizontal: 15),
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
        
              ListView(
                primary: false,
                shrinkWrap: true,
                children: ItemsList.map((buildItems)).toList(),
              ).marginSymmetric(horizontal: 10),
        
          
        
            ],
          ),
        ));
  }
}



Widget buildItems(Item item,{double lefPadding =16.0}){
  bool isExpanded = false;
  if(item.children.isEmpty){
    return ListTile(
      leading: Image.asset("${item.image}"),title: Text(item.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),contentPadding: EdgeInsets.only(left:lefPadding),
      trailing: Text('${item.price??0}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      );
  }
return StatefulBuilder(builder: (context, setState) {
  return ExpansionTile(title: Row(
    children: [
      Image.asset("${item.image}",width: 50,height: 50,),
      Text(item.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    ],
  ),
  
trailing: Text('${item.price??0}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
onExpansionChanged: (value){
  setState((){
    isExpanded= value;
  });
},
leading:  (isExpanded==true)?Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: AppColor.kBlack,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.keyboard_arrow_down_outlined,color: AppColor.kWhite,),
                  )
:Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: AppColor.kBlack,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.keyboard_arrow_right_outlined,color: AppColor.kWhite,),
                  ),
tilePadding: EdgeInsets.only(left: lefPadding),
children: item.children.map((item) => buildItems(item,lefPadding: 16+lefPadding)).toList(),
// children: item.children.map((buildItems)=> item, lefPadding: 16 +lefPadding).toList(),

);
},)
;
}