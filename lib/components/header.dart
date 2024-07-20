import 'package:book_library/components/search_field.dart';
import 'package:book_library/components/section_title.dart';
import 'package:book_library/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/recent.dart';
import 'card_recent.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String searchQuery = '';
  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 406-100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchField(
            onSearch: (query) {
              context.read<BookProvider>().setSearchQuery(query);
            },
          ),
          SectionTitle(title: 'Recent Reads',),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: recents.map((recent){
                int index=recents.indexOf(recent);
                return CardRecent(recent: recent, index: index);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
