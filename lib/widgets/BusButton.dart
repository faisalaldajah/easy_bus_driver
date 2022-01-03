// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class BusButton extends StatelessWidget {

  final String title;
  final Color color;
  final Function onPressed;

  BusButton({this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
      ),
      color: color,
      textColor: Colors.white,
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
          ),
        ),
      ),
    );
  }
}
