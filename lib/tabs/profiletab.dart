// ignore_for_file: prefer_const_constructors

import 'package:easy_bus_driver/brand_colors.dart';
import 'package:easy_bus_driver/globalvariabels.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          color: BrandColors.colorAccent,
          child: Column(
            children: [
              const SizedBox(height: 90),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.person,color: BrandColors.colorAccent,size: 55,),
              ),
              const SizedBox(height: 10),
              Text(currentDriverInfo.fullName,style: TextStyle(color: Colors.white,fontSize: 35),)
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text('Bus Number: ${currentDriverInfo.busNumber}',style: TextStyle(color: Colors.black,fontSize: 25),),
        const SizedBox(height: 20),
        Text('Bus Type: ${currentDriverInfo.busType}',style: TextStyle(color: Colors.black,fontSize: 25),),
        const SizedBox(height: 20),
        Text('phone: ${currentDriverInfo.phone}',style: TextStyle(color: Colors.black,fontSize: 25),),
        const SizedBox(height: 20),
        Text('email: ${currentDriverInfo.email}',style: TextStyle(color: Colors.black,fontSize: 20),),
      ],
    ));
  }
}
