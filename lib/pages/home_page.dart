import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/main.dart'; // 🔑 for `api`

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      // 🔑 Fetch from backend
      final products = await api.getProducts();

      // 🔑 Map backend JSON into your CatalogModel
      CatalogModel.items = products
          .map<Item>((item) => Item.fromMap(item as Map<String, dynamic>))
          .toList();

      setState(() {});
    } catch (e) {
      print("Error loading products: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to load products: $e")));
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
