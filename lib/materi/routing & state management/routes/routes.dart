import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/routing%20&%20state%20management/entities/product_entities.dart';

import '../pages/page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/product_detail':
      final args = settings.arguments as ProductEntities;

      return MaterialPageRoute(
        builder: (context) {
          return ProductDetailPage(
            product: args,
          );
        },
      );

    default:
      return MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Route not found'),
            ),
            body: const Center(child: Text('No Routes')),
          );
        },
      );
  }
}
