import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/pie.dart';
import 'package:expense/AppColors/colors.dart';
import 'package:expense/Controllers/DashBoardController/dashboard_controller.dart';
import 'package:expense/Controllers/sqlController/SqlController.dart';
import 'package:expense/ui/home/CreateCategory/category_transaction_screen.dart';
import 'package:expense/ui/home/CreateCategory/create_category_screen.dart';
import 'package:expense/ui/home/CreateCategory/sub_categories.dart';
import 'package:expense/ui/home/TransactionDetials/GraphicsSummary.dart';
import 'package:expense/ui/home/TransactionDetials/LastTransactionDetails.dart';
import 'package:expense/ui/home/TransactionDetials/ProductSummaryScreen.dart';
import 'package:expense/ui/home/TransactionDetials/Recordator.dart';
import 'package:expense/ui/home/TransactionDetials/TopMonthExpnses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/DataController/DataController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

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

  List<OrdinalData> data = [];
  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ).marginOnly(right: 10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/alarm.png",
                    width: 35,
                    height: 35,
                  ).marginSymmetric(horizontal: 5),
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 35,
                    height: 35,
                  ).marginSymmetric(horizontal: 5),
                  InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (context) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              content: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 105,
                                color: AppColor.kYellow,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Positioned(
                                      top: 10,
                                      left: 8.0, // Adjust the padding here
                                      right: 8.0, // Adjust the padding here
                                      child: Text(
                                        'Is it a funds product or a credit product?',
                                        style: TextStyle(
                                            letterSpacing: 1.0,
                                            color: AppColor.kBlack,
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -20,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // SizedBox(width: MediaQuery.of(context).size.width * 0.16),
                                          InkWell(
                                            onTap: () {
                                              // Handle 'YES' button action
                                              // Get.to(()=>const TopMonthExpenses());
                                              Get.back();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 70,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 2,
                                                    color: AppColor.kBlack),
                                                color: AppColor.kGrey,
                                              ),
                                              child: const Text(
                                                'FUNDS',
                                                style: TextStyle(
                                                  color: AppColor.kBlack,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          InkWell(
                                            onTap: () {
                                              Get.back(); // Close the dialog when 'CANCEL' is tapped
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 70,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColor.kGrey,
                                                border: Border.all(
                                                    width: 2,
                                                    color: AppColor.kBlack),
                                              ),
                                              child: const Text(
                                                'CREDIT',
                                                style: TextStyle(
                                                  color: AppColor.kBlack,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        "assets/images/wallet.png",
                        width: 35,
                        height: 35,
                      ).marginSymmetric(horizontal: 5)),
                  Image.asset(
                    "assets/images/calculator.png",
                    width: 35,
                    height: 35,
                  ).marginSymmetric(horizontal: 5),
                  InkWell(
                      onTap: () {
                        Get.to(() => const TopMonthExpenses());
                      },
                      child: Image.asset(
                        "assets/images/FinanceIcon/matematicas.png",
                        width: 35,
                        height: 35,
                      ).marginSymmetric(horizontal: 5)),
                ],
              ).marginSymmetric(horizontal: 30),
              const SizedBox(height: 10),
              GetBuilder<DataController>(
                builder: (controller) {
                  return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.categoryModelList?.length??0,
                    itemBuilder: (context, index) {
                      print('${controller.categoryModelList?[index].cat_image}');
                      return Container(
                        padding: (index == controller.categoryModelList!.length-1)
                            ? const EdgeInsets.all(15)
                            : const EdgeInsets.all(0),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(10),
                          border: (index == controller.categoryModelList!.length-1)
                              ? Border.all(color: AppColor.kWhite, width: 0)
                              : Border.all(color: AppColor.kBlack, width: 1),
                        ),
                        child: InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            onTap: () async{
                              if (index == controller.categoryModelList!.length-1) {
                                Get.to(() => const CreateCategoryScreen());
                              }else{
                                if(controller.categoryModelList?[index].cat_type==0){
                                  await Get.find<SqlController>().getSpecificBankTransaction(controller.categoryModelList![index]);
                                  Get.to(()=>CategoryTransactionScreen(categoryModel: controller.categoryModelList?[index]));
                                }else{
                                  Get.to(()=>SubCategories(controller.categoryModelList?[index]));
                                }


                              }
                            },
                            child: Image.asset(
                              "${controller.categoryModelList?[index].cat_image}",
                              width: 10,
                              height: 10,
                            )),
                      ).marginAll(10);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                  );
                },
              ),
              // const Divider(thickness:1,color: AppColor.kGrey,),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BALANCE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.kBlack,
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: AppColor.kWhite,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.kBlack,
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColor.kWhite,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Monthly income:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 50,
                          // width: 180,
                          child: TextField()),
                    ),
                  ],
                ),
              ).marginSymmetric(horizontal: 20),

              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Monthly expense:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 50,
                          // width: 180,
                          child: TextField()),
                    ),
                  ],
                ),
              ).marginSymmetric(horizontal: 20),

              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Current balance:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColor.kBlue),
                    ),
                    SizedBox(
                        height: 50,
                        width: 180,
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                  ],
                ),
              ).marginSymmetric(horizontal: 20),

              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.kWhite,
                        ),
                      ).marginOnly(right: 10),
                      InkWell(
                          onTap: () {
                            Get.to(() => const LastTrsnsactionDetail());
                          },
                          child: Text(
                            'Last Transactions:',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                    ],
                  )
                ],
              ).marginOnly(bottom: 15, left: 10, right: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Today ",
                          style: const TextStyle(
                              color: AppColor.kBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text: "Candy",
                          style: TextStyle(
                              color: AppColor.kBlack.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                  const Text(
                    '\$60000',
                    style: TextStyle(
                        color: AppColor.kRed,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ).marginSymmetric(horizontal: 10, vertical: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "12 Jun ",
                          style: const TextStyle(
                              color: AppColor.kBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text: "Hotdog",
                          style: TextStyle(
                              color: AppColor.kBlack.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                  const Text(
                    '\$60000',
                    style: TextStyle(
                        color: AppColor.kRed,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ).marginSymmetric(horizontal: 10, vertical: 5),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const GraphicsSummary());
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'GRAPHICAL SUMMARY:',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )).marginSymmetric(horizontal: 10),
              ),

              const SizedBox(
                height: 20,
              ),

              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPieO(
                  data: data.map((e) {
                    return OrdinalData(domain: e.domain, measure: 20);
                  }).toList(),
                  animate: true, // Optionally, enable animation
                  configRenderPie:
                      const ConfigRenderPie(), // Optionally, customize pie chart rendering
                  animationDuration: const Duration(
                      milliseconds: 300), // Optionally, set animation duration
                  customLabel: (dataPoint, index) {
                    // Optionally, provide a custom label for each data point
                    return '${dataPoint.domain}: ${dataPoint.measure}';
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TOP MONTH EXPENSES:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                    ],
                  )
                ],
              ).marginOnly(bottom: 15, left: 10, right: 10),

              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: AppColor.kBlack,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColor.kWhite,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'TOP MONTH EXPENSES:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Text(
                          "\$25`00000",
                          style: TextStyle(
                              color: AppColor.kRed,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ).marginOnly(bottom: 15, left: 10, right: 10),
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const TopMonthExpenses());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.kGrey),
                  child: const Text(
                    'SEE ALL',
                    style: TextStyle(color: AppColor.kBlack, fontSize: 18),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'RECORDATIONS:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                    ],
                  )
                ],
              ).marginOnly(bottom: 0, left: 10, right: 10, top: 10),

              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '13Jun-24jun',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ).marginOnly(right: 10),
                      Row(
                        children: [
                          Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.kBlack))
                              .marginOnly(right: 10),
                          Text('Light',
                              style: TextStyle(
                                  fontSize: 23,
                                  color: AppColor.kGrey.withOpacity(0.7),
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      const Text('\$150.000',
                          style: TextStyle(
                              color: AppColor.kRed,
                              fontSize: 23,
                              fontWeight: FontWeight.bold)),
                    ],
                  ).marginSymmetric(horizontal: 15);
                },
              ).marginSymmetric(vertical: 10),

              InkWell(
                onTap: () {
                  Get.to(() => const RecordatorPage());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.kGrey),
                  child: const Text(
                    'SEE ALL',
                    style: TextStyle(color: AppColor.kBlack, fontSize: 18),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                      child: Text(
                    'PRODUCT EXPENSE SUMMARY:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                    textAlign: TextAlign.center,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColor.kBlack,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: AppColor.kWhite,
                        ),
                      ),
                    ],
                  )
                ],
              ).marginOnly(bottom: 0, left: 10, right: 10, top: 10),

              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            (index % 2 == 0)
                                ? "assets/images/FinanceIcon/01.png"
                                : "assets/images/FinanceIcon/aplicacion-wallet-pass (1).png",
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text((index % 2 == 0) ? 'Cash' : "DaviPlata",
                              style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.kBlack)),
                        ],
                      ),
                      const Text('\$800.000',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: AppColor.kRed))
                    ],
                  ).marginSymmetric(horizontal: 15, vertical: 2);
                },
              ),

              InkWell(
                onTap: () {
                  Get.to(() => const ProductSummaryScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.kGrey),
                  child: const Text(
                    'SEE ALL',
                    style: TextStyle(color: AppColor.kBlack, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
