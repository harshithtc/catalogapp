import 'package:flutter/material.dart';
import 'package:flutter_catalog/api/api_client.dart';
import 'package:flutter_catalog/core/constants.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/pages/cart_page.dart'; // Add this line
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

final api = ApiClient(baseUrl: kApiBase);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VxState(
      store: MyStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Catalog',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => const HomePage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.cartRoutes: (context) => const CartPage(), // Add this line
        },
      ),
    );
  }
}
