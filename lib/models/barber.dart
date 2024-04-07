class Barber {
  late String email;
  late String telefono;
  late String contrasena;
  late List<String> citas;

  Barber({
    required this.email,
    required this.telefono,
    required this.contrasena,
    required this.citas,
  });

  Barber.empty() {
    email = "";
    telefono = "";
    contrasena = "";
    citas = [];
  }

  Barber.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    telefono = json["telefono"];
    contrasena = json["contrasena"];
    citas = json["citas"].cast<String>();
  }
}
