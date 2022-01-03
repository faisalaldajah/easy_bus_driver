// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:easy_bus_driver/brand_colors.dart';
import 'package:flutter/material.dart';

class TaxiOutlineButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;

  TaxiOutlineButton({this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        borderSide: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: onPressed,
        color: color,
        textColor: color,
        child: Container(
          height: 50.0,
          child: Center(
            child: Text(title,
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Brand-Bold',
                    color: BrandColors.colorText)),
          ),
        ));
  }
}
