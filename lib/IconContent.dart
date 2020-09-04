import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({this.icon,this.label});
  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size:60.0,
        ),
        SizedBox(
          width: 10.0,
          height: 10.0,
        ),
        Text(
          label,


        ),


      ],

    );
  }
}
