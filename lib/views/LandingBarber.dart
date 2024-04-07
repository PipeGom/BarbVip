import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vipbarb/controllers/BaberController.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';

class LandingBarber extends StatefulWidget {
  const LandingBarber({super.key});

  @override
  State<LandingBarber> createState() => _LandingBarberState();
}

class _LandingBarberState extends State<LandingBarber> {
  BarberController _con = BarberController();
  @override
  Widget build(BuildContext context) {
    // Obtén el barbero actual del BarberProvider
    Barber? currentBarber = Provider.of<BarberProvider>(context).currentBarber;
    BarberProvider provider = Provider.of<BarberProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${currentBarber?.name ?? ''}'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Editar perfil'),
              onTap: () {
                // Navega a la página de edición de perfil
                Navigator.pushNamed(context, 'barberUpdate');
              },
            ),
            ListTile(
              title: Text('Eliminar cuenta'),
              onTap: () {
                _con.deleteBarber(context, currentBarber!, provider);
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: Text("Bienvenido ${currentBarber?.name ?? ''}"),
    );
  }
}
