// To parse this JSON data, do
//
//     final productsEntry = productsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductsEntry> productsEntryFromJson(String str) => List<ProductsEntry>.from(json.decode(str).map((x) => ProductsEntry.fromJson(x)));

String productsEntryToJson(List<ProductsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    int productViews;
    DateTime createdAt;
    bool isFeatured;
    int stock;
    User? user;

    ProductsEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.productViews,
        required this.createdAt,
        required this.isFeatured,
        required this.stock,
        this.user,
    });

    factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        productViews: json["product_views"] ?? 0,
        createdAt: json["created_at"] != null 
            ? DateTime.parse(json["created_at"]) 
            : DateTime.now(),
        isFeatured: json["is_featured"] ?? false,
        stock: json["stock"] ?? 0,
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "product_views": productViews,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "stock": stock,
        "user": user?.toJson(),
    };
}

class User {
    int id;
    String username;
    String email;

    User({
        required this.id,
        required this.username,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        username: json["username"] ?? "",
        email: json["email"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
    };
}