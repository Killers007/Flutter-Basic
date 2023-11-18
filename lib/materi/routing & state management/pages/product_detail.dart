import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/routing%20&%20state%20management/entities/product_entities.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntities product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: ListView(
        children: [
          Image.network(
            product.gambar,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.nama,
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  product.getHargaRupiah(),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: const Icon(Icons.arrow_back),
      // ),
    );
  }
}
