import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/routing%20&%20state%20management/entities/product_entities.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<ProductEntities> products = [];

  /// cart from the outside.
  void add(ProductEntities item, int qty) {
    if (!checkIfExist(item.id)) {
      item.qty = qty;
      products.add(item);
    } else {
      ProductEntities? productToUpdate = products.firstWhere(
        (product) => product.id == item.id,
      );
      productToUpdate.qty = qty;
    }
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  int getQtyById(String id) {
    if (checkIfExist(id)) {
      ProductEntities? productToUpdate = products.firstWhere(
        (product) => product.id == id,
      );
      return productToUpdate.qty;
    }

    return 0;
  }

  /// Removes all items from the cart.
  void remove(String id) {
    products.removeWhere((product) => product.id == id);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeAll() {
    products.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  bool checkIfExist(String id) {
    return products.any((product) => product.id == id);
  }
}
