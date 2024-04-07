import 'package:flutter/material.dart';
import 'package:vipbarb/controllers/BarberProvider.dart';
import 'package:vipbarb/models/barber.dart';

class BarberController {
  void saveBarber(context, GlobalKey<FormState> _key, Barber barber,
      BarberProvider provider) {
    print(provider.barbers.length);
    // valido el formulario
    if (_key.currentState!.validate()) {
      //Agregar a la lista del provider
      provider.addBarber(barber);
      Navigator.pushNamed(context, 'barbersManagement');
    }
  }

  void updateBarber(context, GlobalKey<FormState> _key, Barber barber,
      BarberProvider provider) {
    if (_key.currentState!.validate()) {
      provider.updateBarber(barber);
      Navigator.pushNamed(context, 'barbersManagement');
    }
  }

  void deleteBarber(context, Barber barber, BarberProvider provider) {
    provider.deleteBarber(barber);
  }

  String? validField(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo es obligatorio.";
    }
    return null;
  }
}
