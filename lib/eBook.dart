import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'input_page.dart';

class eBook {}

String _launch = "https://www.google.com";
String _laaaunch =
    "https://docs.qgis.org/3.10/en/docs/training_manual/basic_map/symbology.html";
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: const Text("launch in App "),
              onPressed: () {
                _launchInBrowser(_launch);
              },
            ),
            RaisedButton(
              child: const Text("data"),
              onPressed: () {
                _launchInBrowser(_laaaunch);
              },
            )
          ],
        ),
      ),
    );
  }
}
