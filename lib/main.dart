import 'package:flutter/material.dart';
import 'package:news_c6_online/home/home_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      routes:{ HomeScreen.routeName : (_)=>HomeScreen()} ,
      initialRoute: HomeScreen.routeName,
    );
  }
}