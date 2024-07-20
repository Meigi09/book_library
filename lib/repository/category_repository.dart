import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
