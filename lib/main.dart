import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/statefull.dart';
import 'package:flutter_basic/materi/stateless.dart';

void main() {
  runApp(const Materi());
}

class Materi extends StatelessWidget {
  const Materi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materi',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade400),
        useMaterial3: true,
      ),
      home: const Statefull(),
    );
  }
}
