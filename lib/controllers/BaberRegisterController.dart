import 'package:flutter/material.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';

class BarberRegisterController {
  void saveBarber(context, GlobalKey<FormState> _key, Barber barber,
      BarberProvider provider) {
    print(provider.barbers.length);
    // valido el formulario
    if (_key.currentState!.validate()) {
      //Agregar a la lista del provider
      provider.addBarber(barber);
      Navigator.pushNamed(context, 'landingAdmin');
    }
  }

  String? validField(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo es obligatorio.";
    }
    return null;
  }
}
