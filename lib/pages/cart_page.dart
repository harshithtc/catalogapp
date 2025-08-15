import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder<MyStore>(
            mutations: {AddMutation, RemoveMutation},

            builder: (BuildContext context, dynamic store, VxStatus? status) {
              final cart = (store as MyStore).cart;
              return '\$${cart.totalPrice}'.text.xl5
                  .color(MyTheme.darkBluishColor)
                  .make();
            },
          ),

          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet.".text.make()),
              );
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MyTheme.darkBluishColor),
            ),
            child: "Buy".text.color(MyTheme.whiteish).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuild this widget when RemoveMutation (and optionally AddMutation) occurs
    VxState.watch(context, on: [RemoveMutation, AddMutation]);

    final cart = (VxState.store as MyStore).cart;
    final items = cart.items; // assume List<Item>

    if (items.isEmpty) {
      return "Nothing to show".text.xl3.makeCentered();
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index]; // assume non-null
        return ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => RemoveMutation(item),
            tooltip: 'Remove',
          ),
          title: (item.brand ?? "Unknown").text.make(),
        );
      },
    );
  }
}
