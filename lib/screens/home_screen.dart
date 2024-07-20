import 'package:book_library/components/category_list.dart';
import 'package:book_library/components/reading_card_list.dart';
import 'package:book_library/components/search_field.dart';
import 'package:book_library/providers/book_provider.dart';
import 'package:book_library/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Library'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {

            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          SearchField(
            onSearch: (query) {
              context.read<BookProvider>().setSearchQuery(query);
            },
          ),
          CategoryList(
            onCategorySelected: (index) {
              // Implement category selection logic here
            },
          ),
          Expanded(
            child: Consumer<BookProvider>(
              builder: (context, bookProvider, child) {
                return ListView.builder(
                  itemCount: bookProvider.books.length,
                  itemBuilder: (context, index) {
                    final book = bookProvider.books[index];
                    return ReadingListCard(
                      book: book,
                      pressDetails: () {
                        // Implement book details logic here
                      },
                      pressRead: () {
                        // Implement mark as read logic here
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
