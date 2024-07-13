import 'package:book_library/components/category_list.dart';
import 'package:book_library/components/search_box.dart';
import 'package:book_library/widgets/book_carousel.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchBox(onChanged: (value) {  },),
          CategoryList(),
          SizedBox(height: 20.0/2,),
          Expanded(child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  child:BookCarousel()
                  ),
              ),

            ],
          ))
        ],
      ),
    );
  }
}



