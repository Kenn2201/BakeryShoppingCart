import 'package:firebase_auth/firebase_auth.dart';
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

  final currentuser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Bakery Shop'),
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 50.0,
          automaticallyImplyLeading: true,
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
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kBackgroundLight,
                Colors.grey
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountEmail: Text('${currentuser.email!}'),
                accountName: Text('Signed in as:'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage('https://example.com/profile-picture.jpg'),
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kBackgroundLight, Colors.grey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                otherAccountsPictures: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                    },
                  ),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.question_mark),
                title: Text('About App'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('About App'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Developed by: Rico Rhee Vaguchay'),
                            SizedBox(height: 8),
                            Text('Developed by: Kenn Vincent A. Nacario'),
                            SizedBox(height: 8),
                            Text('Developed by: Ronny Christian I. Pacheo'),
                            SizedBox(height: 8),
                            Text('App version: 1.0'),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

                },
              ),
              Divider(color: Colors.grey,),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successfully Logged-Out!'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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
