import 'package:book_library/widgets/book_rating.dart';
import 'package:book_library/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String title;
  final String auth;
  final double rating;
  final Function pressDetails;
  final Function pressRead;
  const BookCard({super.key, required this.image, required this.title, required this.auth, required this.rating, required this.pressDetails, required this.pressRead});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24,bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Colors.white.withOpacity(20)
                  )
                ]
              ),
            ),
          ),
          Image.asset(
              image,
            width: 150,
          ),
          Positioned(
            top: 35,
              right: 10,
              child: Column(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_border_rounded)),
                 BookRating(score:rating,)
                ],
              )),
          Positioned(
              child: Container(
                height: 85,
                width: 202,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: RichText(text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: '$title\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          TextSpan(
                            text: '$auth',
                            style: TextStyle(
                              color: Colors.black12
                            )
                          )
                        ]
                      )),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: pressDetails(),
                          child: Container(
                            width: 101,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Text('Details'),
                          ),
                        ),
                        Expanded(
                            child: RoundedButton(
                              text: 'Read',
                              press: pressRead,
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
