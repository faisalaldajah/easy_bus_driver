import 'package:firebase_database/firebase_database.dart';

class Driver {
  String fullName;
  String email;
  String phone;
  String id;
  String busType;
  String busNumber;
  // ignore: prefer_typing_uninitialized_variables
  var driversIsAvailable;
  // ignore: prefer_typing_uninitialized_variables
  var approveDriver;
  String driverType;
  Driver({
    this.fullName,
    this.email,
    this.phone,
    this.id,
    this.busType,
    this.busNumber,
    this.driversIsAvailable,
    this.approveDriver,
    this.driverType,
  });
  Driver.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    phone = snapshot.value['phone'];
    email = snapshot.value['email'];
    fullName = snapshot.value['fullname'];
    busType = snapshot.value['busType'];
    busNumber = snapshot.value['busNumber'];
    driversIsAvailable = snapshot.value['driversIsAvailable'];
    approveDriver = snapshot.value['approveDriver'];
    driverType = snapshot.value['driverType'];
  }
}
