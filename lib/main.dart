import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location_page.dart';
import 'package:world_time/pages/home_page.dart';
import 'package:world_time/pages/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "World Time",
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/location': (context) => ChooseLocationPage()
      },
    );
  }
}
