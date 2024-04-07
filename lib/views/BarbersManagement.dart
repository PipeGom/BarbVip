import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';
import 'package:vipbarb/controllers/BaberController.dart';

class BarberManagementPage extends StatefulWidget {
  @override
  _BarberManagementPageState createState() => _BarberManagementPageState();
}

class _BarberManagementPageState extends State<BarberManagementPage> {
  BarberController _con = BarberController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Gestion de barberos'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'landingAdmin', (route) => false);
            },
          )),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'barberRegister');
              },
              child: Text('Registrar barbero'),
            ),
            Consumer<BarberProvider>(
              builder: (_, barberProvider, child) {
                List<Barber> barbers = barberProvider.barbers;
                return Expanded(
                  child: barberWidget(barbers, barberProvider),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView barberWidget(List<Barber> barbers, BarberProvider barberProvider) {
    return ListView.builder(
      itemCount: barbers.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      barberProvider.setCurrentBarber(
                          barbers[index]); // setea el barbero actual
                      Navigator.pushNamed(context, 'barberUpdate');
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      barberProvider.setCurrentBarber(barbers[index]);
                      _con.deleteBarber(
                          context, barbers[index], barberProvider);
                    },
                    icon: Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
              ],
            ),
          ),
          title: Text(barberProvider.barbers[index].name),
          subtitle: Text(barberProvider.barbers[index].phone),
        );
      },
    );
  }
}
