import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:easy_bus_driver/datamodels/driver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

User currentFirebaseUser;

final CameraPosition googlePlex = CameraPosition(
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
