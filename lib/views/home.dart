import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/bakery.dart';
import '../models/cake.dart';
import '../models/category.dart';
import '../widgets/bakery_card.dart';
import '../widgets/cake_card.dart';
import '../widgets/category_card.dart';
import '../widgets/custom_list_tile.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundLight,
        appBar: AppBar(
          title: const Text('Bakery Shop'),
          backgroundColor: kBackgroundDark,
          elevation: 0,
          toolbarHeight: 50.0,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              margin: const EdgeInsets.only(left: 18.0, top: 5.0),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.grey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25.0),
            const CustomListTile(title: "Today's best deals"),
            const SizedBox(height: 15.0),
            SizedBox(
              width: double.infinity,
              height: 250.0,
              // color: Colors.black12,
              child: ListView.builder(
                itemCount: cakeList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var cake = cakeList[index];
                  return CakeCard(
                    cake: cake,
                  );
                },
              ),
            ),
            const CustomListTile(title: "Discover by category"),
            const SizedBox(height: 15.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ListView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var category = categoryList[index];
                  return CategoryCard(category: category);
                },
              ),
            ),
            const SizedBox(height: 25.0),
            const CustomListTile(title: "Popular Pastries"),
            const SizedBox(height: 15.0),
            ListView.builder(
              itemCount: bakeryList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var bakery = bakeryList[index];

                return BakeryCard(bakery: bakery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
