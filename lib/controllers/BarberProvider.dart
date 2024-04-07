import 'package:flutter/foundation.dart';
import 'package:vipbarb/models/barber.dart';

class BarberProvider with ChangeNotifier {
  List<Barber> _barbers = [];

  List<Barber> get barbers => _barbers;

  void addBarber(Barber barber) {
    _barbers.add(barber);
    notifyListeners();
  }
}
