import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_flutter/brand_colors.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:uber_flutter/styles/styles.dart';
import 'package:uber_flutter/widgets/brand_divider.dart';
import 'package:geolocator/geolocator.dart';

class MainPage extends StatefulWidget {
  static const String id = "mainpage";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  double mapPaddingBottom = 0;
  var geolocator = Geolocator();

  Position currentPosition;

  void setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );

    currentPosition = position;

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = new CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        width: 250,
        color: Colors.white,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 160,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'images/user_icon.png',
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Aditya Rathi",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Brand-Bold',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("View Profile"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              BrandDivider(),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(OMIcons.cardGiftcard),
                title: Text(
                  "Free Rides",
                  style: kDrawerItemStyle,
                ),
              ),
              ListTile(
                leading: Icon(OMIcons.creditCard),
                title: Text(
                  "Payments",
                  style: kDrawerItemStyle,
                ),
              ),
              ListTile(
                leading: Icon(OMIcons.history),
                title: Text(
                  "Ride History",
                  style: kDrawerItemStyle,
                ),
              ),
              ListTile(
                leading: Icon(OMIcons.contactSupport),
                title: Text(
                  "Support",
                  style: kDrawerItemStyle,
                ),
              ),
              ListTile(
                leading: Icon(OMIcons.info),
                title: Text(
                  "About",
                  style: kDrawerItemStyle,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapPaddingBottom),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              mapController = controller;

              setState(() {
                mapPaddingBottom = 280;
              });

              setupPositionLocator();
            },
          ),
          Positioned(
            top: 44,
            left: 20,
            child: GestureDetector(
              onTap: () {
                scaffoldKey.currentState.openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.7, 0.7),
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                    )
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Nice to see you!",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Where are you going ?",
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Brand-Bolt',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Search Destination"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          OMIcons.home,
                          color: BrandColors.colorDimText,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Add Home"),
                            SizedBox(height: 3),
                            Text(
                              "Your residential address",
                              style: TextStyle(
                                fontSize: 11,
                                color: BrandColors.colorDimText,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BrandDivider(),
                    SizedBox(height: 16.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          OMIcons.workOutline,
                          color: BrandColors.colorDimText,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Add Work"),
                            SizedBox(height: 3),
                            Text(
                              "Your office address",
                              style: TextStyle(
                                fontSize: 11,
                                color: BrandColors.colorDimText,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
