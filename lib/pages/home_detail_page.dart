// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.whiteish,
      bottomNavigationBar: Container(
        color: Color(0xfff5f5f5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            catalog.price.text.xl4.bold.make(),

            Padding(
              padding: EdgeInsetsGeometry.only(right: 16.0),

              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    MyTheme.darkBluishColor,
                  ),
                ),
                child: "Buy".text.color(MyTheme.whiteish).make(),
              ),
            ).wh(100, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.brand.toString()),
              child: Image.network(catalog.imageUrl),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Color(0xfff5f5f5),
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.brand.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.model.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
