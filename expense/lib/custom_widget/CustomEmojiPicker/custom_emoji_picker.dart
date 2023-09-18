import 'package:expense/Controllers/EmojiPopUpController/EmojiPopUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class EmojiTabController extends StatelessWidget {
  final TabController? tabController;
  final List<String>? AnimalEmoji;
  final List<String>? BabyEmoji;
  final List<String>? BusinessEmoji;
  final List<String>? CarEmoji;
  final List<String>? EntertainmentEmoji;
  final List<String>? FamilyEmoji;
  final List<String>? FinanceEmoji;
  final List<String>? FoodAndDrinksEmoji;
  final List<String>? GymEmoji;
  final List<String>? HealthCareEmoji;
  final List<String>? HomeEmoji;
  final List<String>? ITComputerIEmoji;
  final List<String>? MakupEmoji;
  final List<String>? RestaurantEmoji;
  final List<String>? RopaClothingEmoji;
  final List<String>? ServicesEmoji;
  final List<String>? ShoppingEmoji;
  final List<String>? SportsEmoji;
  final List<String>? StatisticsEmoji;
  final List<String>? StudiesEducationEmoji;
  final List<String>? SubscriptionEmoji;
  final List<String>? TransportEmoji;
  final List<String>? UsersEmoji;
  final List<String>? VacationEmoji;

  const EmojiTabController(

      {
        this.tabController,
        this.AnimalEmoji,
        this.BabyEmoji,
        this.BusinessEmoji,
        this.CarEmoji,
        this.EntertainmentEmoji,
        this.FamilyEmoji,
        this.FinanceEmoji,
        this.FoodAndDrinksEmoji,
        this.GymEmoji,
        this.HealthCareEmoji,
        this.HomeEmoji,
        this.ITComputerIEmoji,
        this.MakupEmoji,
        this.RestaurantEmoji,
        this.RopaClothingEmoji,
        this.ServicesEmoji,
        this.ShoppingEmoji,
        this.SportsEmoji,
        this.StatisticsEmoji,
        this.StudiesEducationEmoji,
        this.SubscriptionEmoji,
        this.TransportEmoji,
        this.UsersEmoji,
        this.VacationEmoji,
        super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      contentPadding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 2),
      content: SizedBox(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width*0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TabBar(
              controller: tabController,
              indicatorColor: Colors.red,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelColor: Colors.black,

              tabs: const [
                Tab(text: 'Animals'),
                Tab(text: 'Baby'),
                Tab(text: 'Business'),
                Tab(text: 'Cars'),
                Tab(text: 'Entertainment'),
                Tab(text: 'Family'),
                Tab(text: 'Finance'),
                Tab(text: 'Food and Drinks'),
                Tab(text: 'Gym'),
                Tab(text: 'Health Care'),
                Tab(text: 'Home'),
                Tab(text: 'Computer IT'),
                Tab(text: 'Makeup'),
                Tab(text: 'Restaurant'),
                Tab(text: 'Cloths'),
                Tab(text: 'Services'),
                Tab(text: 'Shopping'),
                Tab(text: 'Sports'),
                Tab(text: 'Statistics'),
                Tab(text: 'Education'),
                Tab(text: 'Subscription'),
                Tab(text: 'Transport'),
                Tab(text: 'People'),
                Tab(text: 'Vacation'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width*0.8, // Adjust the height as needed
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: tabController,
                children: [
                  EmojiTab(tabEmojis: AnimalEmoji??[]),
                  EmojiTab(tabEmojis: BabyEmoji??[]),
                  EmojiTab(tabEmojis: BusinessEmoji??[]),
                  EmojiTab(tabEmojis: CarEmoji??[]),
                  EmojiTab(tabEmojis: EntertainmentEmoji??[]),
                  EmojiTab(tabEmojis: FamilyEmoji??[]),
                  EmojiTab(tabEmojis: FinanceEmoji??[]),
                  EmojiTab(tabEmojis: FoodAndDrinksEmoji??[]),
                  EmojiTab(tabEmojis: GymEmoji??[]),
                  EmojiTab(tabEmojis: HealthCareEmoji??[]),
                  EmojiTab(tabEmojis: HomeEmoji??[]),
                  EmojiTab(tabEmojis: ITComputerIEmoji??[]),
                  EmojiTab(tabEmojis: MakupEmoji??[]),
                  EmojiTab(tabEmojis: RestaurantEmoji??[]),
                  EmojiTab(tabEmojis: RopaClothingEmoji??[]),
                  EmojiTab(tabEmojis: ServicesEmoji??[]),
                  EmojiTab(tabEmojis: ShoppingEmoji??[]),
                  EmojiTab(tabEmojis: SportsEmoji??[]),
                  EmojiTab(tabEmojis: StatisticsEmoji??[]),
                  EmojiTab(tabEmojis: StudiesEducationEmoji??[]),
                  EmojiTab(tabEmojis: SubscriptionEmoji??[]),
                  EmojiTab(tabEmojis: TransportEmoji??[]),
                  EmojiTab(tabEmojis: UsersEmoji??[]),
                  EmojiTab(tabEmojis: VacationEmoji??[]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmojiTab extends StatelessWidget {
  final List<String> tabEmojis;

  const EmojiTab({required this.tabEmojis,super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Number of emojis per row
      ),
      itemCount: tabEmojis.length,
      itemBuilder: (context, index) {
        return Center(
          child: GestureDetector(
            onTap: ()async {
              // You can handle emoji selection here
              final selectedEmoji = tabEmojis[index];
             await Get.find<EmojiPopUpController>().setSelectedImage(selectedEmoji);
              print('Selected Emoji: $selectedEmoji');
              Get.back();
              // return selectedEmoji;
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: AssetImage(tabEmojis[index]),
                  fit: BoxFit.fill,
                )
              ),
            ),
            // child: Text(
            //   tabEmojis[index],
            //   style: TextStyle(fontSize: 24.0),
            // ),
          ),
        ).marginAll(10);
      },
    );
  }
}
