import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  // Getter to access the current selected index
  int get selectedIndex => _selectedIndex;

  // Method to update the selected index
  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();  // Notify listeners to update the UI
  }
}
