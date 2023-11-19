import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/utils/localstorage.dart';
import 'pages/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageUtils.init(); // Initialize SharedPreferences

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        // brightness: Brightness.dark,
        primaryColor: Colors.greenAccent.shade700,
      ),
      home: const Auth(),
    );
  }
}
