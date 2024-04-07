import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vipbarb/controllers/BaberRegisterController.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';

class BaberRegisterPage extends StatefulWidget {
  const BaberRegisterPage({super.key});

  @override
  State<BaberRegisterPage> createState() => _BaberRegisterPageState();
}

class _BaberRegisterPageState extends State<BaberRegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  BarberRegisterController _con = BarberRegisterController();
  Barber barber = Barber.empty(); // barbero que se va a crear
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.of(context).size.width * 0.15;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de barbero'),
      ),
      body: Center(
        child:
            Consumer<BarberProvider>(builder: (context, barberProvider, child) {
          return formBarber(margin, barberProvider);
        }),
      ),
    );
  }

// Este formulario me va consumir el provider, porque realiza cambios en los barberos
  Form formBarber(double margin, barberProvider) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) =>
                    barber.name = value, // alamacenar nombre en el objeto
                validator: _con
                    .validField, // el argumento value es el valor que tiene TextFormField y este es enviado por flutter
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                onChanged: (value) => barber.phone = value,
                validator: _con.validField,
                decoration: InputDecoration(labelText: 'Telefono'),
              ),
              TextFormField(
                onChanged: (value) => barber.email = value,
                validator: _con.validField,
                decoration: InputDecoration(labelText: 'Correo'),
              ),
              TextFormField(
                onChanged: (value) => barber.contrasena = value,
                validator: _con.validField,
                decoration: InputDecoration(labelText: 'Contraseña'),
              ),
              TextFormField(
                onChanged: (value) => _passwordController.text =
                    value, // usamos el controlador para validar que las contrasenas sean iguales
                validator: _con.validField,
                decoration: InputDecoration(labelText: 'Confirmar contraseña'),
              ),
              OutlinedButton(
                  onPressed: () {
                    //print(barber);
                    _con.saveBarber(context, _key, barber, barberProvider);
                  },
                  child: Text('Registrar'))
            ],
          ),
        ),
      ),
    );
  }
}
