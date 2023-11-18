import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/routing%20&%20state%20management/entities/product_entities.dart';
import 'package:provider/provider.dart';

import '../model/cart_model.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  final ProductEntities product;
  int quantity;

  ProductCard({
    Key? key,
    required this.product,
    this.quantity = 0,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // int quantity = 0;

  @override
  Widget build(BuildContext context) {
    CartModel cartModel = Provider.of<CartModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_detail',
            arguments: widget.product);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => ProductDetailPage(product: widget.product)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey.shade200, // Border color
            width: 1.5, // Border width
          ),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row 2 Bagian Gambar dan Deskripsi
            Flexible(
              flex: 3,
              child: Image.network(
                widget.product.gambar,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            // Gunakan flexible agar text tidak overflow
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.nama,
                          style: const TextStyle(fontSize: 18),
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          widget.product.getHargaRupiah(),
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  if (widget.quantity == 0)
                    GestureDetector(
                      onTap: () {
                        cartModel.add(widget.product, 1);
                        widget.quantity = 1;
                        setState(() {});
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.add_shopping_cart_rounded),
                      ),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.quantity = 0;
                            cartModel.remove(widget.product.id);

                            setState(() {});
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.delete_sweep_outlined,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.quantity--;
                            cartModel.add(widget.product, widget.quantity);

                            setState(() {});
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Text(widget.quantity.toString()),
                        GestureDetector(
                          onTap: () {
                            widget.quantity++;
                            cartModel.add(widget.product, widget.quantity);
                            setState(() {});
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
