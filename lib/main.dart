import 'package:flutter/material.dart';
import "package:practica2pmm/screens/home_screen.dart";
import "package:practica2pmm/screens/personal_screen.dart";
import "package:practica2pmm/screens/widget_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica2',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/edit": (context) => PersonalScreen(),
        "/widgets": (context) => WidgetScreen(),
      },
    );
  }
}