import 'package:flutter/material.dart';

class MyImagePreview extends StatelessWidget {
  final String imageUrl;

  // ignore: prefer_const_constructors_in_immutables
  MyImagePreview({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }
}
