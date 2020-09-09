import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Routemap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("map"),

        actions: <Widget>[
        IconButton(

            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),


        ],
      ),
body: Center(
  child:Image(
    image: NetworkImage('https://saudiprojects.net/wp-content/uploads/2016/04/0004.jpg'),


  ),
),

    );
  }
}
