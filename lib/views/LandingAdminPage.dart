import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';

class LandingAdminPage extends StatefulWidget {
  @override
  _LandingAdminPageState createState() => _LandingAdminPageState();
}

class _LandingAdminPageState extends State<LandingAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome admin!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Gestionar barberos'),
              onTap: () {
                Navigator.pushNamed(context, 'barbersManagement');
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                // Lógica para la opción 2
              },
            ),
            // Agrega más opciones de menú aquí
          ],
        ),
      ),
      body: Center(
        child: Consumer<BarberProvider>(builder: (_, barberProvider, child) {
          List<Barber> barbers = barberProvider.barbers;
          return barberWidget(barbers, barberProvider);
        }),
      ),
    );
  }

  ListView barberWidget(List<Barber> barbers, BarberProvider barberProvider) {
    return ListView.builder(
        itemCount: barbers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(barberProvider.barbers[index].name),
            subtitle: Text(barberProvider.barbers[index].phone),
          );
        });
  }
}
