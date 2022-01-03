import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:easy_bus_driver/datamodels/driver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

User currentFirebaseUser;

CameraPosition googlePlex = const CameraPosition(
  target: LatLng(31.954066, 35.931066),
  zoom: 14.4746,
);

String mapKey = 'AIzaSyASM6GHRPd8Itw1GDN6OGLlsYWTe03qLrU';

StreamSubscription<Position> homeTabPositionStream;

StreamSubscription<Position> ridePositionStream;

final assetsAudioPlayer = AssetsAudioPlayer();

Position currentPosition;

DatabaseReference rideRef;

Driver currentDriverInfo;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
void showSnackBar(String title) {
  final snackbar = SnackBar(
    content: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
  );
  // ignore: deprecated_member_use
  scaffoldKey.currentState.showSnackBar(snackbar);
}

//قم ياضافة اسماء المناطق في هذا المكان
List<String> places = ['ragdan', 'marka'];
