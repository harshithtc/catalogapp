import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rebuild when AddMutation (and optionally RemoveMutation) occurs
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final cart = (VxState.store as MyStore).cart;

    // Prefer checking by id unless Item overrides == and hashCode
    final bool isInCart = cart.items.any((i) => i.id == catalog.id);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(MyTheme.darkBluishColor),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : Icon(CupertinoIcons.cart_badge_plus, color: MyTheme.whiteish),
    );
  }
}
