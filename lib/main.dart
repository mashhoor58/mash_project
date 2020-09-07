import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(Sahalat());

//test test test

class Sahalat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0E21),
        primaryColor: Color(0xff0A0E21),
      ),
      home: InputPage(),
    );
  }
}
