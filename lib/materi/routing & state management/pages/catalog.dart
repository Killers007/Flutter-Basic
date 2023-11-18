// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/routing%20&%20state%20management/entities/product_entities.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../repository/product_data.dart';
import '../widget/product_card.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    CartModel cartModel = Provider.of<CartModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: Center(
        child: ListView(
          children: productEntitiessFromJson(productsData)
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
