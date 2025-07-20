import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final days = 30;
  final name = "codeeeee";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Center(child: Text("welcome to $days days challenge by $name")),
      drawer: Drawer(),
    );
  }
}
