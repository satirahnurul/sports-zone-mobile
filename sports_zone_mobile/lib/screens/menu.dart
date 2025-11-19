import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sports_zone_mobile/widgets/left_drawer.dart';
import 'package:sports_zone_mobile/screens/newslist_form.dart';
import 'package:sports_zone_mobile/widgets/products_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.shopping_bag, Colors.blue),
    ItemHomepage("My Products", Icons.inventory, Colors.green),
    ItemHomepage("Create Product", Icons.add, Colors.red),
    ItemHomepage("Logout", Icons.logout, Colors.orange)
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Sports Zone" dengan teks putih dan tebal.
        title: const Text(
          'Sports Zone',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: LeftDrawer(),
      // Body halaman dengan padding di sekelilingnya.
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di Sports Zone',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
