import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {


  Completer<GoogleMapController> _controller = Completer();




  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
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
          IconButton(

              icon: Icon(FontAwesomeIcons.search),
              onPressed: ()async {
                Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                print(position);
          },
          ),


        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(24.774265, 46.738586), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(24.774265, 46.738586), zoom: zoomVal)));
  }
@override
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://1.bp.blogspot.com/-ABm5hzJZ1RA/Wi43bMWEh8I/AAAAAAAAJ00/74ewF-6fRjEdNyhfU3rj0WmItJiC3WYLwCPcBGAYYCw/s640/download.jpg ',
                  24.6799742, 46.8119647,
                  "station"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://1.bp.blogspot.com/-ABm5hzJZ1RA/Wi43bMWEh8I/AAAAAAAAJ00/74ewF-6fRjEdNyhfU3rj0WmItJiC3WYLwCPcBGAYYCw/s640/download.jpg ',
                  24.7479140, 46.6171618,
                  "station1"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://1.bp.blogspot.com/-ABm5hzJZ1RA/Wi43bMWEh8I/AAAAAAAAJ00/74ewF-6fRjEdNyhfU3rj0WmItJiC3WYLwCPcBGAYYCw/s640/download.jpg ',
                  24.7479140, 46.6171618,
                  "station2"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://1.bp.blogspot.com/-ABm5hzJZ1RA/Wi43bMWEh8I/AAAAAAAAJ00/74ewF-6fRjEdNyhfU3rj0WmItJiC3WYLwCPcBGAYYCw/s640/download.jpg ',
                  24.6018909, 46.6234543,
                  "station3"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://1.bp.blogspot.com/-ABm5hzJZ1RA/Wi43bMWEh8I/AAAAAAAAJ00/74ewF-6fRjEdNyhfU3rj0WmItJiC3WYLwCPcBGAYYCw/s640/download.jpg ',
                  24.8212842, 46.7552359,
                  "station4"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  'https://1.bp.blogspot.com/-ABm5hzJZ1RA/Wi43bMWEh8I/AAAAAAAAJ00/74ewF-6fRjEdNyhfU3rj0WmItJiC3WYLwCPcBGAYYCw/s640/download.jpg ',
                  24.6872441, 46.5823725,
                  "station5"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: ()  {
        _gotoLocation(lat, long);
      },


      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "saudi \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(24.774265, 46.738586), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker4,
          Marker5,
          Marker6,
          Marker1,
          Marker2,
          Marker3
        },
      ),
    );



  }
  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker Marker1 = Marker(
  markerId: MarkerId('station'),
  position: LatLng(24.6799742, 46.8119647),
  infoWindow: InfoWindow(title: 'station'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker Marker2 = Marker(
  markerId: MarkerId('station1'),
  position: LatLng(24.6398815, 46.7461001),
  infoWindow: InfoWindow(title: ' station1'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker Marker3 = Marker(
  markerId: MarkerId('station2'),
  position: LatLng(24.7479140, 46.6171618),
  infoWindow: InfoWindow(title: 'station2'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker Marker4 = Marker(
  markerId: MarkerId('station3'),
  position: LatLng(24.6018909, 46.6234543),
  infoWindow: InfoWindow(title: 'station3'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker Marker5 = Marker(
  markerId: MarkerId('station4'),
  position: LatLng(24.8212842, 46.7552359),
  infoWindow: InfoWindow(title: 'station4'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker Marker6 = Marker(
  markerId: MarkerId('station5'),
  position: LatLng(24.6872441, 46.5823725),
  infoWindow: InfoWindow(title: 'station5'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
