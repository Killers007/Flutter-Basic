import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;
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

  final currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  @override
  Widget build(BuildContext context) {
    return Container(
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
              widget.product['gambar'],
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
                        widget.product['nama'],
                        style: const TextStyle(fontSize: 18),
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        currencyFormatter.format(widget.product['harga']),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                if (widget.quantity == 0)
                  GestureDetector(
                    onTap: () {
                      widget.quantity++;
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
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.delete_sweep_outlined),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.quantity--;
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.remove),
                        ),
                      ),
                      Text(widget.quantity.toString()),
                      GestureDetector(
                        onTap: () {
                          widget.quantity++;
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
    );
  }
}
