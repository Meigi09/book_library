import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  const RoundedButton({super.key, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius:
            BorderRadius.only(
                topLeft: Radius.circular(29),
                bottomRight: Radius.circular(29)
            )
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),

      ),
    );
  }
}
