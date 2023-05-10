import 'package:flutter/material.dart';
import 'package:bakerymobileapp/constants.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundLight,
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: kBackgroundDark,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with your actual cart item count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: Text('Item ${index + 1}'), // Replace with your actual item name
                  subtitle: const Text('Price: \$10'), // Replace with your actual item price
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '\$50', // Replace with your actual total price
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Place your checkout logic here
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
