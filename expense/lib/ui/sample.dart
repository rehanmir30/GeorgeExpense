
 
import 'package:flutter/material.dart';

class MyCustomTab extends StatefulWidget {
  const MyCustomTab({super.key});
 
  @override
  State<MyCustomTab> createState() => _MyCustomTabState();
}
 
class _MyCustomTabState extends State<MyCustomTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Custom SubTap"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_literals_to_create_immutables
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Colors.white),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: const Color.fromARGB(255, 169, 199, 251),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  dividerColor: Colors.black,
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    const Tab(
                      text: "Quantity 1",
                     
                    ),
                    const Tab(
                      text: 'Quantity 2',
                      
                    ),
                     
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  MyTabOne(),
                  MyTabTwo(),
                  // MyPostTab(),
                  // MyReelsTab(),
                  // MyTagTab(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class MyTabOne extends StatelessWidget {
  const MyTabOne({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("This is Tab One",style: TextStyle(fontSize: 20),));
  }
}
class MyTabTwo extends StatelessWidget {
  const MyTabTwo({super.key});
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // SwitcherButton(
            //   value: true,
            //   onChange: (value) {
            //     print(value);
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelColor: Colors.black,
                  dividerColor: Colors.black,
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    const Tab(
                      text: "Live",
                    ),
                    const Tab(
                      text: "Result",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              // ignore: prefer_const_literals_to_create_immutables
              child: TabBarView(children: [
                // MyLivePage(),
                // MyResultPage(),
              ]),
            ),
             
          ],
        ),
      ),
    );
  }
}