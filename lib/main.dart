import 'package:book_library/providers/book_provider.dart';
import 'package:book_library/providers/theme_provider.dart';
import 'package:book_library/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BookLibraryApp());
}

class BookLibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Book Library',
            theme: themeProvider.isDarkTheme ? themeProvider.darkTheme : themeProvider.lightTheme,
            darkTheme: ThemeData.dark(),
            home: HomeScreen(),

          );
        },
      ),
    );
  }
}
