import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/pie.dart';
import 'package:expense/ui/home/TransactionDetials/TopMonthExpnses.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import '../../../AppColors/colors.dart';

class GraphicsSummary extends StatefulWidget {
  const GraphicsSummary({super.key});

  @override
  State<GraphicsSummary> createState() => _GraphicsSummaryState();
}

class _GraphicsSummaryState extends State<GraphicsSummary> with SingleTickerProviderStateMixin {
    TabController? tabController ;


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
  void initState() {
    super.initState();
    tabController = TabController(length: 24, vsync: this);

    data.add(OrdinalData(domain: 'Animals', measure: 1));
    data.add(OrdinalData(domain: 'Baby', measure: 2));
    data.add(OrdinalData(domain: 'Business', measure: 3));
    data.add(OrdinalData(domain: 'Cars', measure: 4));
    data.add(OrdinalData(domain: 'Entertainment', measure: 5));
    data.add(OrdinalData(domain: 'Family', measure: 6));
    data.add(OrdinalData(domain: 'Finance', measure: 7));
  }

  List<OrdinalData> data=[];

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: AppColor.kBlack,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: AppColor.kWhite,
                      ),
                    ),
                  ),
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
              ),
              const Text('GRAPHICS SUMMARY',style: TextStyle(color: AppColor.kBlack,fontWeight: FontWeight.bold,fontSize: 22),),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: AppColor.kGrey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.kBlack, width: 2)),
                      child: const Text(
                        'TODAY',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ).marginSymmetric(horizontal: 5),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: AppColor.kGrey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.kBlack, width: 2)),
                      child: const Text(
                        'THIS MONTH',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ).marginSymmetric(horizontal: 5),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: AppColor.kGrey.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.kBlack, width: 2)),
                      child: const Text(
                        'CUSTOM',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ).marginSymmetric(horizontal: 5),
                    
                    
                  ],
                ).marginSymmetric(horizontal: 15),
              ),
              const SizedBox(height: 10,),

              const Text('Jan 1 2022 untill Des 31-2022',style:TextStyle(color: AppColor.kGreen,fontSize: 21,fontWeight: FontWeight.bold)),


              
            AspectRatio(
              aspectRatio: 16/9,
              child: DChartPieO(
                data: data.map((e) {
                  return OrdinalData(domain: e.domain, measure: 20);
                }).toList(),
                animate: true, // Optionally, enable animation
                configRenderPie: const ConfigRenderPie(), // Optionally, customize pie chart rendering
                animationDuration: const Duration(milliseconds: 300), // Optionally, set animation duration
                customLabel: (dataPoint, index) {
                  // Optionally, provide a custom label for each data point
                  return '${dataPoint.domain}: ${dataPoint.measure}';
                },
                  
              ),
            ),

            const SizedBox(height: 10,),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('CATEGORIES',style:TextStyle(color: AppColor.kBlack,fontSize: 22,fontWeight: FontWeight.bold))),


               ListView(
                primary: false,
                shrinkWrap: true,
                children: ItemsList.map((buildItems)).toList(),
              ).marginSymmetric(horizontal: 0),


            ],
          ),
        ),
      ),
    );
  }
}
