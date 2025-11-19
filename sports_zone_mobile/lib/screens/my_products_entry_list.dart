import 'package:flutter/material.dart';
import 'package:sports_zone_mobile/models/products_entry.dart';
import 'package:sports_zone_mobile/widgets/left_drawer.dart';
import 'package:sports_zone_mobile/screens/products_detail.dart';
import 'package:sports_zone_mobile/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductsEntryListPage extends StatefulWidget {
  const MyProductsEntryListPage({super.key});

  @override
  State<MyProductsEntryListPage> createState() => _MyProductsEntryListPageState();
}

class _MyProductsEntryListPageState extends State<MyProductsEntryListPage> {
  Future<List<ProductsEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/my-products/');
    
    var data = response;
    
    List<ProductsEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductsEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You haven\'t created any products yet.',
                      style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductsEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}