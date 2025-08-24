import 'package:flutter_catalog/models/cart.dart';

import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CartModel cart;

  MyStore() {
    cart = CartModel();
  }
}

MyStore get store => VxState.store as MyStore;
