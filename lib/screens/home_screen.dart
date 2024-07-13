import 'package:book_library/widgets/body.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black26,
      centerTitle: false,
      leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu_rounded)),
      actions: [
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications))
      ],
    );
  }}
