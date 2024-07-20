import 'package:book_library/model/book.dart';
import 'package:book_library/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterBook extends StatefulWidget {
  @override
  _RegisterBookState createState() => _RegisterBookState();
}

class _RegisterBookState extends State<RegisterBook> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _author = '';
  double _rating = 0;
  bool _isRead = false;
  String _image = '';
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
                onSaved: (value) {
                  _author = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rating'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a rating';
                  }
                  return null;
                },
                onSaved: (value) {
                  _rating = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
                onSaved: (value) {
                  _image = value!;
                },
              ),
              SwitchListTile(
                title: Text('Read'),
                value: _isRead,
                onChanged: (value) {
                  setState(() {
                    _isRead = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Favorite'),
                value: _isFavorite,
                onChanged: (value) {
                  setState(() {
                    _isFavorite = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newBook = Book(
                      title: _title,
                      author: _author,
                      rating: _rating,
                      isRead: _isRead,
                      image: _image,
                      isFavorite: _isFavorite,
                      id: DateTime.now().millisecondsSinceEpoch,
                    );
                    context.read<BookProvider>().addBook(newBook);
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
