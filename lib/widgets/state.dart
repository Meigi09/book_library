import 'package:book_library/items/book.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void editBook(Book book) {
    // Implement edit logic
    notifyListeners();
  }

  void deleteBook(int id) {
    _books.removeWhere((book) => book.id == id);
    notifyListeners();
  }

// Other necessary methods
}
