// import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_flutter/screens/loginpage.dart';
import 'package:uber_flutter/screens/mainpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: "1:781725035719:android:12ccb67fadf23aa613a2e2",
      messagingSenderId:
          "781725035719-9kjqlnb44jp798e7f4vk642tled953o0.apps.googleusercontent.com",
      databaseURL: "https://uber-clone-74ae7-default-rtdb.firebaseio.com",
      apiKey: "AIzaSyCdEPScUYGrLyrWem8LCY9XHvdVbHO0H80",
      projectId: "uber-clone-74ae7",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Brand-Regular',
      ),
      home: LoginPage(),
    );
  }
}
