import 'package:flutter/material.dart';

class KeyboardProvider extends ChangeNotifier {
  String _inputValue = '';

  String get inputValue => _inputValue;

  void addCharacter(String value) {
    _inputValue += value;
    notifyListeners();
  }

  void removeCharacter() {
    if (_inputValue.isNotEmpty) {
      _inputValue = _inputValue.substring(0, _inputValue.length - 1);
      notifyListeners();
    }
  }

  void clear() {
    _inputValue = '';
    notifyListeners();
  }
}