// import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_flutter/screens/loginpage.dart';
import 'package:uber_flutter/screens/mainpage.dart';
import 'package:uber_flutter/screens/registration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Brand-Regular',
        ),
        initialRoute: RegistrationPage.id,
        routes: {
          RegistrationPage.id: (context) => RegistrationPage(),
          MainPage.id: (context) => MainPage(),
          LoginPage.id: (context) => LoginPage(),
        });
  }
}
