import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';

class LoginController {
  GlobalKey<FormState> key;
  BuildContext context;

  LoginController({required this.key, required this.context});

  String? validField(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo es obligatorio.";
    }
    return null;
  }

  void login(String email, String password) {
    if (!key.currentState!.validate()) return;

    // Obtén la lista de barberos
    List<Barber> barbers =
        Provider.of<BarberProvider>(context, listen: false).barbers;

    // Verifica si el correo electrónico y la contraseña proporcionados coinciden con algún barbero en la lista
    Barber? barber = barbers.firstWhere(
      (barber) => barber.email == email && barber.contrasena == password,
      orElse: () => Barber.empty(),
    );
    // Si el barbero existe, permite el acceso como barbero
    if (barber.email != '') {
      Provider.of<BarberProvider>(context, listen: false)
          .setCurrentBarber(barber);

      /// barbero logeado
      Navigator.popAndPushNamed(context, "landingBarber");
    } else if (email == "saurmo" && password == "admin123") {
      // Si el correo electrónico y la contraseña son del administrador, permite el acceso como administrador
      Navigator.popAndPushNamed(context, "landingAdmin");
    } else {
      // Si no se encontró el barbero y las credenciales no son del administrador, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Correo electrónico o contraseña incorrectos')));
    }
  }
}
