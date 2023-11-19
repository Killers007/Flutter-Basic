// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/local%20storage%20&%20consume%20api/pages/github.dart';
import '../utils/shared_preferences.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    if (SharedPreferencesUtils.isAuthenticated()) {
      return Github();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SharedPreferencesUtils.setAuthenticated(true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Github()),
                );
              },
              child: Text(!SharedPreferencesUtils.isAuthenticated()
                  ? 'Login'
                  : 'Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome! You are authenticated.'),
      ),
    );
  }
}
