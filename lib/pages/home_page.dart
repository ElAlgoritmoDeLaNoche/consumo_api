import 'dart:convert';
import 'package:consumo_api/env.dart';
import 'package:consumo_api/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Env env;

  Future<List<Product>> _listadoProducts;

  _getProducts() async {
    env = Env();
    //print("${env.API_URL}/products");
    final response = await http.get("${env.API_URL}/products");

    List<Product> p = [];

    if (response.statusCode == 200) {
      // ignore: avoid_print
      //print(response.body);
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      print(jsonData["products"]);
      //print(jsonData["products"][0]["images"]);
      for (var item in jsonData["products"]) {
        p.add(
          Product(
            name: item["name"],
          ),
        );
      }
    } else {
      throw Exception('Error en la conexion');
    }
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Conveniocom'),
      ),
    );
  }
}
