import 'package:flutter/material.dart';

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
    // Simular Logica para validar el usuario
    if (email == "saurmo" && password == "admin123") {
      // Lo enviamos a usuariosPage
      Navigator.popAndPushNamed(context, "landingAdmin");
    }
  }
}
