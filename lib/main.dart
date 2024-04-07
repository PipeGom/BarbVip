import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/views/LandingAdminPage.dart';
import 'package:vipbarb/views/LoginPage.dart';
import 'package:vipbarb/views/BarberRegisterPage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BarberProvider()),
    ],
    child: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'landingAdmin': (context) => LandingAdminPage(),
        'barberRegister': (context) => BaberRegisterPage(),
      },
    );
  }
}
