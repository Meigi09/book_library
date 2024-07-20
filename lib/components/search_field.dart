import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String) onSearch;

  const SearchField({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20, top: 15),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: onSearch,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Here',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.green,
              minWidth: 50,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(15),
              child: Icon(
                Icons.search_rounded,
                size: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
