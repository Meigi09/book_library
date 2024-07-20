import 'package:book_library/providers/book_provider.dart';
import 'package:book_library/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_library/model/book.dart';
import 'package:book_library/components/custom_rect_tween.dart';

class RegisterBook extends StatelessWidget {
  const RegisterBook({super.key});

  @override
  Widget build(BuildContext context) {
    const String _heroAddTodo = 'add-todo-hero';
    final _titleController = TextEditingController();
    final _authorController = TextEditingController();
    final _imageController = TextEditingController();
    final _descriptionController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _authorController,
                      decoration: InputDecoration(
                        hintText: 'Author',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _imageController,
                      decoration: InputDecoration(
                        hintText: 'Image URL',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    MaterialButton(
                      onPressed: () {
                        final book = Book(
                          id: DateTime.now().millisecondsSinceEpoch,
                          title: _titleController.text,
                          author: _authorController.text,
                          rating: 4.0, // Example rating, you can modify it
                          isRead: false,
                          image: _imageController.text,
                        );
                        Provider.of<BookProvider>(context, listen: false).addBook(book);
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
