import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final days = 30;

  final name = "codeeeee";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(catalogJson);

    var productsData = decodedData["item"];
    CatalogModel.items = productsData
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatalogModel.items.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) =>
                    ItemWidget(item: CatalogModel.items[index]),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
 