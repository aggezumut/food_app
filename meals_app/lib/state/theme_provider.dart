import 'package:flutter/cupertino.dart';

class AppThemeState with ChangeNotifier {
  
  //Getter
  bool _selectedState = true;
  bool get selecteState => _selectedState;

  //Setter
  void toggleStatus() {
    _selectedState == true ? _selectedState = false : _selectedState = true;
    notifyListeners();
  }

  // theme değiştimrke isin true dalse
}
