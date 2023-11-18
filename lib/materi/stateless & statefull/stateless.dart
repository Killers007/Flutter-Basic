// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/stateless%20&%20statefull/widget/product_card.dart';

class Stateless extends StatelessWidget {
  const Stateless({super.key});

  static List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'nama': 'Ayam Krispy McD+ 3 Reg. Nasi+ 3 Reg.r',
      'harga': 65000,
      'gambar':
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/38290848-ef6b-4859-aeba-518c85502059_TPO-211387.jpg?auto=format',
    },
    {
      'id': '2',
      'nama': 'Tiramisu McFlurry with Lotus Biscoff',
      'harga': 18000,
      'gambar':
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/b8e290fc-65e2-4e26-b9f6-a3c5dce8a978_TPO-133133_1.jpg?auto=format',
    },
    {
      'id': '3',
      'nama': 'PaNas Special Ayam Krispy McD Thai Sweet Chili, Med',
      'harga': 49500,
      'gambar':
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/450b07c9-e1c9-4cdf-8aa0-239791e48db5_TPO-111233.jpg?auto=format'
    },
    {
      'id': '4',
      'nama': 'Blackcurrant Fizz',
      'harga': 14500,
      'gambar':
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/0597a602-ab87-416a-9ed7-4560635a66a5_TPO-184068.jpg?auto=format'
    },
    {
      'id': '5',
      'nama': 'Iced Coffee Matcha',
      'harga': 23000,
      'gambar':
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/5605d267-4f84-4cf2-954c-36491e6210bd_TPO-134008.jpg?auto=format'
    },
    {
      'id': '6',
      'nama': 'Blueberry Cheesecake Pie',
      'harga': 17000,
      'gambar':
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/ca88f189-c93e-4073-8268-6afe0ce60465_TPO-183045.jpg?auto=format'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Materi Dasar Widget'),
        ),
        body: Center(
          child: ListView(
            children: products
                .map(
                  (product) => ProductCard(
                    product: product,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
