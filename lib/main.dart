import 'package:flutter/material.dart';
import 'package:vipbarb/views/LandingAdminPage.dart';
import 'package:vipbarb/views/LoginPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'landingAdmin': (context) => LandingAdminPage(),
      },
    );
  }
}
