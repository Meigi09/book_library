import 'package:flutter/material.dart';

class BookCarousel extends StatefulWidget {
  const BookCarousel({super.key});

  @override
  State<BookCarousel> createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  //PageController _pageController;
  int initialPage=1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _pageController=PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   // _pageController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            itemBuilder: (context,index)=>
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.blue,
                )),

      ),
    );
  }
}
