import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.success,
    this.productsCount,
    this.resPerPage,
    this.filteredProductsCount,
    this.products,
  });

  bool success;
  int productsCount;
  int resPerPage;
  int filteredProductsCount;
  List<Product> products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        success: json["success"],
        productsCount: json["productsCount"],
        resPerPage: json["resPerPage"],
        filteredProductsCount: json["filteredProductsCount"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "productsCount": productsCount,
        "resPerPage": resPerPage,
        "filteredProductsCount": filteredProductsCount,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.price,
    this.ratings,
    this.stock,
    this.numOfReviews,
    this.id,
    this.name,
    this.description,
    this.category,
    this.seller,
    this.images,
    this.user,
    this.reviews,
    this.createdAt,
  });

  double price;
  int ratings;
  int stock;
  int numOfReviews;
  String id;
  String name;
  String description;
  String category;
  String seller;
  List<Image> images;
  String user;
  List<dynamic> reviews;
  DateTime createdAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        price: json["price"].toDouble(),
        ratings: json["ratings"],
        stock: json["stock"],
        numOfReviews: json["numOfReviews"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        seller: json["seller"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        user: json["user"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "ratings": ratings,
        "stock": stock,
        "numOfReviews": numOfReviews,
        "_id": id,
        "name": name,
        "description": description,
        "category": category,
        "seller": seller,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "user": user,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Image {
  Image({
    this.id,
    this.publicId,
    this.url,
  });

  String id;
  String publicId;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["_id"],
        publicId: json["public_id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "public_id": publicId,
        "url": url,
      };
}
