import 'package:flutter/material.dart';

class TaxiButtton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;

  TaxiButtton({this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: color,
      textColor: Colors.white,
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        height: 50.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Brand-Bold',
            ),
          ),
        ),
      ),
    );
  }
}
