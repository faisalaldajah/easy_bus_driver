// ignore_for_file: use_key_in_widget_constructors

import 'package:easy_bus_driver/globalvariabels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_bus_driver/dataprovider.dart';
import 'package:easy_bus_driver/screens/StartPage.dart';
import 'package:easy_bus_driver/screens/UnRegistration.dart';
import 'package:easy_bus_driver/screens/login.dart';
import 'package:easy_bus_driver/screens/mainpage.dart';
import 'package:easy_bus_driver/screens/registration.dart';
import 'package:easy_bus_driver/screens/vehicleinfo.dart';

//flutter build appbundle --target-platform android-arm,android-arm64,android-x64
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: await_only_futures
  currentFirebaseUser = await FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute:
            (currentFirebaseUser == null) ? LoginPage.id : StartPage.id,
        routes: {
          MainPage.id: (context) => MainPage(),
          RegistrationPage.id: (context) => RegistrationPage(),
          VehicleInfoPage.id: (context) => VehicleInfoPage(),
          LoginPage.id: (context) => LoginPage(),
          StartPage.id: (context) => StartPage(),
          UnRegistration.id: (context) => UnRegistration(),
        },
      ),
    );
  }
}
