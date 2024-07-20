import 'package:flutter/material.dart';
import 'package:book_library/model/category.dart';

class CategoryList extends StatefulWidget {
  final Function(int) onCategorySelected;

  const CategoryList({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          int index = categories.indexOf(category);
          return InkWell(
            onTap: () {
              setState(() {
                selected = index;
              });
              widget.onCategorySelected(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              alignment: Alignment.center,
              height: 41,
              margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: selected == index ? Colors.green : Colors.transparent),
              child: Text(
                category.title,
                style: TextStyle(
                    fontSize: selected == index ? 14 : 12,
                    fontWeight: FontWeight.w600,
                    color: selected == index ? Colors.white : Colors.grey.shade400),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
