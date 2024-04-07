import 'package:flutter/material.dart';

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
              title: Text('Gestión de barberos'),
              onTap: () {
                // Lógica para la opción 1
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
        child: Text('Contenido de la página'),
      ),
    );
  }
}
