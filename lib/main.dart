import 'package:flutter/material.dart';
import 'package:wallcraft/pages/favorites_page.dart';
import 'package:wallcraft/pages/main_page.dart';
import 'package:wallcraft/resources/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        backgroundColor: Colors.lime[100],
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        ProjectStrings.favoritePageRoute: (context) => FavoritePage(),
      },
    );
  }
}
