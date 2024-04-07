import 'package:flutter/foundation.dart';
import 'package:vipbarb/models/barber.dart';

class BarberProvider with ChangeNotifier {
  List<Barber> _barbers = [];
  Barber? currentBarber;

  List<Barber> get barbers => _barbers;

  void addBarber(Barber barber) {
    _barbers.add(barber);
    notifyListeners();
  }

  void setCurrentBarber(Barber barber) {
    currentBarber = barber;
    notifyListeners();
  }

  void updateBarber(Barber barber) {
    int index = _barbers.indexWhere((element) => element.email == barber.email);
    _barbers[index] = barber;
    notifyListeners();
  }

  void deleteBarber(Barber barber) {
    _barbers.removeWhere((element) => element.email == barber.email);
    notifyListeners();
  }
}
