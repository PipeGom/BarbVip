import 'package:flutter/material.dart';
import 'package:vipbarb/controllers/LoginController.dart';

class LoginPage extends StatelessWidget {
  String email = "";
  String password = "";
  late LoginController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createForm(context),
          ],
        ),
      ),
    );
  }

  Form createForm(context) {
    GlobalKey<FormState> key = GlobalKey();
    _controller = LoginController(key: key, context: context);
    return Form(
      key: key,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => email = value,
                validator: _controller.validField,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Correo",
                  hintText: "Ingrese su correo",
                ),
              ),
              TextFormField(
                onChanged: (value) => password = value,
                obscureText: true,
                validator: _controller.validField,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  hintText: "Ingrese su contraseña",
                ),
              ),
              ElevatedButton(
                onPressed: () => _controller.login(email, password),
                child: const Text("Login"),
              ),
              const TextButton(
                onPressed: null,
                child: Text("Registrarme como cliente"),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, 'barberRegister'),
                child: Text("Registrarme como barbero"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
