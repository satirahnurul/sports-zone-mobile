import 'package:flutter/material.dart';
import 'package:sports_zone_mobile/screens/menu.dart';
// TODO: Impor halaman NewsFormPage jika sudah dibuat
import 'package:sports_zone_mobile/screens/newslist_form.dart';
import 'package:sports_zone_mobile/screens/products_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
            child: Column(
              children: [
                Text(
                  'Sports Zone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Seluruh produk Sports Zone ada disini!",
                    // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            // Bagian redirection ke NewsFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke NewsFormPage di sini,
              setelah halaman NewsFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsFormPage(),
                  ));
            },
          ),
          ListTile(
              leading: const Icon(Icons.add_reaction_rounded),
              title: const Text('Products List'),
              onTap: () {
                  // Route to news list page
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductsEntryListPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}