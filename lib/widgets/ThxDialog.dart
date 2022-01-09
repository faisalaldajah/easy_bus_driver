// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:easy_bus_driver/brand_colors.dart';
import 'package:easy_bus_driver/helpers/helpermethods.dart';
import 'package:easy_bus_driver/widgets/BusButton.dart';
import 'package:flutter/material.dart';

class ThxDialog extends StatelessWidget {
  final String title;
  final Function onTap;
  ThxDialog({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(4.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'thx',
              style: TextStyle(fontFamily: 'Brand-Bold', fontSize: 50),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 230,
              child: BusButton(
                title: 'CONFIRM',
                color: BrandColors.colorGreen,
                onPressed: onTap,
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
