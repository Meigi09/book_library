import 'dart:ffi';

class Book {
  int id;
  String title;
  String author;
  double rating;
  bool isRead;

  Book({required this.id, required this.title, required this.author, required this.rating, required this.isRead});

  int get _id=>id;
  String get _title=>title;
  String get _author=>author;
  double get _rating=>rating;
  bool get _isRead=>isRead;


}
