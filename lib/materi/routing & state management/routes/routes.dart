import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/routing%20&%20state%20management/entities/product_entities.dart';

import '../pages/page.dart';

class Routes {
  // ignore: constant_identifier_names
  static const PRODUCT_DETAIL = '/product_detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PRODUCT_DETAIL:
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
}
