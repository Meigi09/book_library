import 'package:flutter/material.dart';
import 'package:book_library/model/book.dart';
import 'package:book_library/repository/book_repository.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];
  List<Book> get books => _books;

  String _sortCriteria = 'title';
  String _filterCriteria = 'all';
  String _searchQuery = '';

  BookProvider() {
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    _books = await BookRepository.instance.fetchAllBooks();
    notifyListeners();
  }

  Future<void> addBook(Book book) async {
    await BookRepository.instance.addBook(book);
    fetchBooks();
  }

  Future<void> updateBook(Book book) async {
    await BookRepository.instance.updateBook(book);
    fetchBooks();
  }

  Future<void> deleteBook(int id) async {
    await BookRepository.instance.deleteBook(id);
    fetchBooks();
  }

  void setSortCriteria(String criteria) {
    _sortCriteria = criteria;
    sortAndFilterBooks();
  }

  void setFilterCriteria(String criteria) {
    _filterCriteria = criteria;
    sortAndFilterBooks();
  }

  void sortAndFilterBooks() {
    // Implement sorting and filtering logic here
    notifyListeners();
  }
  void setSearchQuery(String query) {
    _searchQuery = query;
    filterBooks();
  }

  void filterBooks() {
    if (_searchQuery.isEmpty) {
      fetchBooks();
    } else {
      _books = _books.where((book) =>
          book.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }
    notifyListeners();
  }
}
