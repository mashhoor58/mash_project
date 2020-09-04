import 'package:flutter/material.dart';
class SahaltWidget extends StatelessWidget {
  SahaltWidget({@required this.colour,this.cChild,this.onPress});
  final Color colour;
  final Widget cChild;
  final Function onPress;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        child: cChild,
        margin: EdgeInsets.all(15.0),
        decoration:BoxDecoration(
            color: colour,
            borderRadius:BorderRadius.circular(10.0)


        ),

      ),
    );
  }
}
