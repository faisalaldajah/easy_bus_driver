// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:easy_bus_driver/brand_colors.dart';
import 'package:easy_bus_driver/globalvariabels.dart';
import 'package:easy_bus_driver/screens/login.dart';
import 'package:easy_bus_driver/screens/mainpage.dart';
import 'package:easy_bus_driver/widgets/GradientButton.dart';
import 'package:easy_bus_driver/widgets/ProgressDialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'register';

  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<File> images = <File>[];
  List<Asset> images1 = <Asset>[];
  int noOfImagescanAdd = 5;
  String error = 'No Error Dectected';
  var fullNameController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var socialDriverNumberController = TextEditingController();

  var busType = TextEditingController();

  var busNumberController = TextEditingController();

  var carColorController = TextEditingController();
  var driverType = '';

  bool economy = false;
  bool taxi = false;
  void registerUser() async {
    //show please wait dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
          ProgressDialog(status: 'جاري تسجيل الحساب'),
    );

    final User user = (await _auth
            .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
            .catchError((ex) {
      Navigator.pop(context);
      showSnackBar('تحقق من الاسم او الرقم السري');
    }))
        .user;

    Navigator.pop(context);
    // check if user registration is successful
    if (user != null) {
      DatabaseReference newDriverRef =
          FirebaseDatabase.instance.reference().child('drivers/${user.uid}');
      //nedd to set destination bus
      //Prepare data to be saved on users table
      Map userMap = {
        'fullname': fullNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'socialDriverNumber': socialDriverNumberController.text,
        'busType': busType.text,
        'driversIsAvailable': false,
        'busNumber': busNumberController.text,
        'approveDriver': 'false',
        'driverType': driverType,
      };
      newDriverRef.set(userMap);

      currentFirebaseUser = user;

      //Take the user to the mainPage
      Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Image(
                  alignment: Alignment.center,
                  height: 280.0,
                  width: 280.0,
                  image: AssetImage('images/task.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BrandColors.colorAccent,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 0.3,
                              color: BrandColors.colorDimText,
                            ),
                          ],
                        ),
                        child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                //driverCarStyle = 'bus_driver';
                              });
                            },
                            child: Center(
                              child: Image.asset('images/bus-school.png'),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      // Fullname
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'الاسم كامل',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Email Address
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'الايميل',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: const TextStyle(fontSize: 14),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      // Phone
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            labelText: 'رقم الهاتق',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: const TextStyle(fontSize: 14),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      // Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'رقم السري',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: busType,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'نوع الباص',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: socialDriverNumberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'رقم الوطني لسائق',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: busNumberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'رقم الباص',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Visibility(
                        visible: driverType == '',
                        child: Container(
                          width: 120,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              chooseDistrectlBottomSheet(context);
                            },
                            child: Text('اختر الخط'),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'خط سير الباص: $driverType',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GradientButton(
                        title: 'تسجيل',
                        onPressed: () async {
                          //check network availability
                          var connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult != ConnectivityResult.mobile &&
                              connectivityResult != ConnectivityResult.wifi) {
                            showSnackBar('No internet connectivity');

                            return;
                          }
                          if (fullNameController.text.length < 3) {
                            showSnackBar('Please provide a valid fullname');
                            return;
                          }
                          if (phoneController.text.length < 10) {
                            showSnackBar('Please provide a valid phone number');
                            return;
                          }
                          if (!emailController.text.contains('@')) {
                            showSnackBar(
                                'Please provide a valid email address');
                            return;
                          }
                          if (passwordController.text.length < 8) {
                            showSnackBar(
                                'password must be at least 8 characters');
                            return;
                          }
                          registerUser();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginPage.id, (route) => false);
                          },
                          child: Text(
                            'you have an account, Login here',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDistrectlBottomSheet(context) {
    showModalBottomSheet(
      elevation: 5,
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(
            //color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: Wrap(
              children: <Widget>[
                Container(height: 10),
                Center(
                  child: Text(
                    'choose place',
                    style: TextStyle(),
                  ),
                ),
                Container(height: 10),
                Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: ListView(
                    children: places
                        .map(
                          (e) => ListTile(
                            title: Text(
                              e.toString(),
                              style: TextStyle(fontSize: 22),
                            ),
                            trailing: Icon(
                              Icons.place,
                              color: BrandColors.colorAccent,
                            ),
                            onTap: () async {
                              setState(() {
                                driverType = e.toString();
                              });
                              Navigator.pop(context);
                            },
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> loadImagesAssets() async {
    try {
      await MultiImagePicker.pickImages(
        maxImages: noOfImagescanAdd,
        enableCamera: true,
        selectedAssets: images1,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#339A58",
          statusBarColor: "#339A58",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#339A58",
        ),
      ).then((value) {
        value.forEach((assetFile) async {
          var bytes = await assetFile.getByteData();
          String dir = (await getApplicationDocumentsDirectory()).path;
          await writeToFile(bytes, '$dir/${assetFile.name}.jpg');
          File tempFile = File('$dir/${assetFile.name}.jpg');
          setState(() {
            images.add(tempFile);
          });

          noOfImagescanAdd -= 1;
        });
      });
    } on Exception catch (e) {
      error = e.toString();
    }
  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}
