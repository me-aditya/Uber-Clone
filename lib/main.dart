// import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uber_flutter/dataprovider/app_data.dart';
import 'package:uber_flutter/screens/loginpage.dart';
import 'package:uber_flutter/screens/mainpage.dart';
import 'package:uber_flutter/screens/registration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: "1:781725035719:android:12ccb67fadf23aa613a2e2",
      messagingSenderId: "781725035719",
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
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Brand-Regular',
          ),
          initialRoute: MainPage.id,
          routes: {
            RegistrationPage.id: (context) => RegistrationPage(),
            MainPage.id: (context) => MainPage(),
            LoginPage.id: (context) => LoginPage(),
          }),
    );
  }
}
