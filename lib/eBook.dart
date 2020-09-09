import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'input_page.dart';

class eBook {}

String _launch = 'http://novelfreereadonline.com/the-two-towers/book-iii-chapter-1-128543';
String _laaaunch = 'http://novelfreereadonline.com/the-hobbit/-chapter-1-an-unexpected-party-128586';
String _laaunch = 'http://novelfreereadonline.com/the-man-with-the-golden-gun/page-1-991147';
String _laaaaunch = 'http://novelfreereadonline.com/the-sea-wolves/page-1-124676';


Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'header_key': 'header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

class eBooklinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
      Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(

            child:Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(

                  child: RaisedButton(
                    child: const Text("The Two Towers "),
                    onPressed: () {
                      _launchInBrowser(_launch);
                    },
                  ),



                  ),
               Expanded(

                 child: Image(

                   image: NetworkImage('http://novelfreereadonline.com/img/truyen/The-Two-Towers.jpg'),
                     width: 50,
                     height: 50,
                     fit:BoxFit.fill,
                 ),
               ),
],
                ),

                  ),
              ],

            ),

          ),
          Expanded(
            child: Container(
              child: RaisedButton(
                child: const Text("The Hobbit "),
                onPressed: () {
                  _launchInBrowser(_laaaunch);
                },
              ),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color:Color(0xFF111328),
                borderRadius: BorderRadius.circular(10.0),

              ),
            ),
          ),
          Expanded(
            child: Container(
              child: RaisedButton(
                child: const Text("The Man With the Golden Gun"),
                onPressed: () {
                  _launchInBrowser(_laaunch);
                },
              ),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color:Color(0xFF111328),
                borderRadius: BorderRadius.circular(10.0),

              ),
            ),
          ),
          Expanded(
            child: Container(
              child: RaisedButton(
                child: const Text("The Sea Wolves"),
                onPressed: () {
                  _launchInBrowser(_laaaaunch);
                },
              ),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color:Color(0xFF111328),
                borderRadius: BorderRadius.circular(10.0),

              ),
            ),
          ),
        ],
      ),


    );

  }
}