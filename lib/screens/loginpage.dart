import 'package:flutter/material.dart';
import 'package:uber_flutter/brand_colors.dart';
import 'package:uber_flutter/screens/registration_page.dart';
import 'package:uber_flutter/widgets/taxi_button.dart';

class LoginPage extends StatelessWidget {
  static const String id = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Image(
                image: AssetImage('images/logo.png'),
                width: 100.0,
                height: 100.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Sign In as a rider",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Brand-Bold',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TaxiButtton(
                      title: "LOGIN",
                      color: BrandColors.colorGreen,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RegistrationPage.id, (route) => false);
                },
                child: Text(
                  "Don't have an account, sign up here",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
