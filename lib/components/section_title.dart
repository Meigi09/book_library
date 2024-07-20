import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        bottom: 12,
      ),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black
        ),
      ),
    );
  }
}
