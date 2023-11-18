// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../widget/product_card.dart';

class Carts extends StatelessWidget {
  const Carts({super.key});

  @override
  Widget build(BuildContext context) {
    CartModel cartModel = Provider.of<CartModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts'),
      ),
      body: Center(
        child: ListView(
          children: cartModel.products
              .map(
                (product) => ProductCard(
                  product: product,
                  quantity: cartModel.getQtyById(product.id),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
