import 'package:flutter/material.dart';
class Routemap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0A0E21),
          primaryColor: Color(0xff0A0E21),
        ),
        home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(' M'),//ffdkkk
        ),
body: Center(
  child:Image(
    image: NetworkImage('https://saudiprojects.net/wp-content/uploads/2016/04/0004.jpg'),


  ),
),
      ),
    );
  }
}
