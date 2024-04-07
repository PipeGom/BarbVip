class Barber {
  late String name = "";
  late String email;
  late String phone;
  late String contrasena;
  late List<String> citas;

  Barber({
    required this.email,
    required this.phone,
    required this.contrasena,
    required this.citas,
  });

  Barber.empty() {
    name = "";
    email = "";
    phone = "";
    contrasena = "";
    citas = [];
  }

  Barber.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phone = json["telefono"];
    contrasena = json["contrasena"];
    citas = json["citas"].cast<List<String>>();
  }
}
