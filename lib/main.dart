import 'package:flutter/material.dart';
import "package:practica2pmm/screens/home_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica2',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        //"/edit": (context) => PersonalScreen(),
        //"/widgets": (context) => WidgetScreen(),
      },
    );
  }
}