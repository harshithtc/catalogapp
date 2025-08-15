import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final days = 30;

  final name = "codeeeee";

  final url =
      "https://raw.githubusercontent.com/harshithtc/flutter_catalog_data/refs/heads/main/catalog.json ";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    try {
      // Fetch data from the URL
      final response = await http.get(
        Uri.parse(url.trim()),
      ); // trim() removes extra space in URL

      if (response.statusCode == 200) {
        // Convert the response body to JSON
        final decodedData = jsonDecode(response.body);

        var productsData = decodedData["item"];
        CatalogModel.items = List.from(
          productsData,
        ).map<Item>((item) => Item.fromMap(item)).toList();
        setState(() {});
      } else {
        // Handle errors
        print("Failed to load data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      floatingActionButton: VxBuilder<MyStore>(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext ctx, dynamic store, VxStatus? status) {
          final cart = (store as MyStore).cart;
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoutes),
            backgroundColor: MyTheme.greyish,
            child: const Icon(CupertinoIcons.cart),
          ).badge(
            color: const Color.fromARGB(255, 152, 23, 23),
            size: 20,
            count: cart.items.length,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
            ),
          );
        },
      ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator().centered().expand()),
            ],
          ),
        ),
      ),
    );
  }
}
