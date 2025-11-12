import 'package:flutter/material.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:sports_zone_mobile/widgets/left_drawer.dart';

class NewsFormPage extends StatefulWidget {
    const NewsFormPage({super.key});

    @override
    State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _price = "";
  String _description = "";
  String _category = 'sepatu bola';
  String _thumbnail = "";
  int _stock = 0;
  bool _isFeatured = false;

  // Category options sesuai model Django
  final List<String> _categories = [
    'sepatu bola',
    'kaos kaki',
    'jersey',
    'tas bola',
    'bola',
  ];
  
  // Category labels
  final Map<String, String> _categoryLabels = {
    'sepatu bola': 'Sepatu Bola',
    'kaos kaki': 'Kaos Kaki',
    'jersey': 'Jersey',
    'tas bola': 'Tas Bola',
    'bola': 'Bola',
  };

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Products Form',
              ),
            ),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
          ),
          // TODO: Tambahkan drawer yang sudah dibuat di sini
          drawer: LeftDrawer(),
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
// === Name Field ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (value.length < 3) {
                      return 'Nama produk minimal 3 karakter';
                    }
                    if (value.length > 100) {
                      return 'Nama produk maksimal 100 karakter';
                    }
                    return null;
                  },
                ),
              ),
              
              // === Price Field ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga Produk",
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    prefixText: 'Rp ',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga tidak boleh kosong!';
                    }
                    final price = int.tryParse(value);
                    if (price == null) {
                      return 'Harga harus berupa angka bulat';
                    }
                    if (price <= 0) {
                      return 'Harga harus lebih besar dari 0';
                    }
                    if (price > 999999999) {
                      return 'Harga terlalu besar';
                    }
                    return null;
                  },
                ),
              ),
              
              // === Description Field ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi tidak boleh kosong!';
                    }
                    if (value.length < 10) {
                      return 'Deskripsi minimal 10 karakter';
                    }
                    if (value.length > 500) {
                      return 'Deskripsi maksimal 500 karakter';
                    }
                    return null;
                  },
                ),
              ),
              
              // === Category Dropdown ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(_categoryLabels[cat]!),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),
              
              // === Stock Field ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah Stock",
                    labelText: "Stock",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _stock = int.tryParse(value ?? '0') ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Stock tidak boleh kosong!';
                    }
                    final stock = int.tryParse(value);
                    if (stock == null) {
                      return 'Stock harus berupa angka bulat';
                    }
                    if (stock < 0) {
                      return 'Stock tidak boleh negatif';
                    }
                    if (stock > 999999) {
                      return 'Stock terlalu besar';
                    }
                    return null;
                  },
                ),
              ),
              
              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (opsional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value ?? '';
                    });
                  },
                  validator: (String? value) {
                    if (value != null && value.isNotEmpty) {
                      final urlPattern = RegExp(
                        r'^https?:\/\/.+\.(jpg|jpeg|png|gif|webp)$',

                        caseSensitive: false,
                      );
                      if (!urlPattern.hasMatch(value)) {
                        return 'URL harus valid dan berakhiran .jpg, .png, .gif, atau .webp';
                      }
                    }
                    return null;
                  },
                ),
              ),
              
              // === Is Featured Switch ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                  secondary: const Icon(Icons.star),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // === Save Button ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: $_price', ),
                                    Text('Deskripsi: $_description'),
                                    Text('Kategori: ${_categoryLabels[_category]}'),
                                    Text('Stock: $_stock'),
                                    Text('Thumbnail: $_thumbnail'),
                                    Text(
                                          'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ],               
            ),
          ),
        )
      );
    }
}