import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vipbarb/controllers/BaberController.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';

class BaberUpdatePage extends StatefulWidget {
  const BaberUpdatePage({super.key});

  @override
  State<BaberUpdatePage> createState() => _BaberUpdatePageState();
}

class _BaberUpdatePageState extends State<BaberUpdatePage> {
  final GlobalKey<FormState> _key = GlobalKey();
  BarberController _con = BarberController();

  Barber barber = Barber.empty(); // barbero que se va a crear

  TextEditingController _nameCon = TextEditingController();
  TextEditingController _emailCon = TextEditingController();
  TextEditingController _phoneCon = TextEditingController();
  TextEditingController _passwordCon = TextEditingController();
  TextEditingController _confirmPasswordCon = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // solo cambia cuando hay un cambio en el provider, asi evitamos que se queden las actualizaciones no completas
    barber =
        Provider.of<BarberProvider>(context, listen: false).currentBarber ??
            Barber.empty();

    // seteamos los valores del barbero en los controladores
    _nameCon.text = barber.name;
    _phoneCon.text = barber.phone;
    _emailCon.text = barber.email;
    _passwordCon.text = barber.contrasena;
    _confirmPasswordCon.text = barber.contrasena;
  }

  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.of(context).size.width * 0.15;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar barbero'),
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
                controller: _nameCon, // alamacenar nombre en el objeto
                validator: _con
                    .validField, // el argumento value es el valor que tiene TextFormField y este es enviado por flutter
                decoration: InputDecoration(
                    labelText: 'Nombre', suffixIcon: Icon(Icons.edit)),
              ),
              TextFormField(
                controller: _phoneCon,
                validator: _con.validField,
                decoration: InputDecoration(
                    labelText: 'Telefono', suffixIcon: Icon(Icons.edit)),
              ),
              TextFormField(
                controller: _emailCon,
                validator: _con.validField,
                decoration: InputDecoration(
                    labelText: 'Correo', suffixIcon: Icon(Icons.edit)),
              ),
              TextFormField(
                controller: _passwordCon,
                validator: _con.validField,
                decoration: InputDecoration(
                    labelText: 'Contraseña', suffixIcon: Icon(Icons.edit)),
              ),
              TextFormField(
                controller:
                    _confirmPasswordCon, // usamos el controlador para validar que las contrasenas sean iguales
                validator: _con.validField,
                decoration: InputDecoration(
                    labelText: 'Confirmar contraseña',
                    suffixIcon: Icon(Icons.edit)),
              ),
              OutlinedButton(
                  onPressed: () {
                    //print(barber);
                    //Asignamos lo valores en los campos de texto al objeto barber
                    barber.name = _nameCon.text;
                    barber.phone = _phoneCon.text;
                    barber.email = _emailCon.text;
                    barber.contrasena = _passwordCon.text;

                    _con.updateBarber(context, _key, barber, barberProvider);
                  },
                  child: Text('Actualizar'))
            ],
          ),
        ),
      ),
    );
  }
}
