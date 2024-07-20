import 'package:book_library/model/recent.dart';
import 'package:flutter/material.dart';

class CardRecent extends StatelessWidget {
  const CardRecent({super.key, required this.recent, required this.index});

  final Recent recent;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 228,
      height: 120,
      margin: EdgeInsets.only(
        right: 20,
        bottom: 10,
        top: 10,
        left: index==0?20:0,
      ),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                color: Colors.grey.shade200
            )
          ]
      ),
      child: Row(
        children: [
          Image.asset(recent.image),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                recent.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10,),
              Text('${recent.percent} Completed',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
