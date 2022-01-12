// ignore_for_file: file_names, prefer_const_constructors

import 'package:easy_bus_driver/globalvariabels.dart';
import 'package:easy_bus_driver/widgets/GradientButton.dart';
import 'package:easy_bus_driver/widgets/ThxDialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FixTab extends StatefulWidget {
  FixTab({Key key}) : super(key: key);

  @override
  State<FixTab> createState() => _FixTabState();
}

class _FixTabState extends State<FixTab> {
  DatabaseReference database = FirebaseDatabase.instance
      .reference()
      .child('drivers/${currentFirebaseUser.uid}/fixData');
  var frontController = TextEditingController();
  var rearController = TextEditingController();
  var oilController = TextEditingController();
  var exController = TextEditingController();
  var diseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 15),
            const Text(
              'ملاحظات الهيئة الامامية',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            TextField(
              controller: frontController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'ملاحظات الهيئة الامامية',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
              style: const TextStyle(fontSize: 14),
            ),
            SizedBox(height: 15),
            const Text(
              'ملاحظات الهيئة الخلفية',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            TextField(
              controller: rearController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'ملاحظات الهيئة الخلفية',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
              style: const TextStyle(fontSize: 14),
            ),
            SizedBox(height: 15),
            const Text(
              'ملاحظات البزين',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            TextField(
              controller: diseController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'ملاحظات الديزل',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
              style: const TextStyle(fontSize: 14),
            ),
            SizedBox(height: 15),
            const Text(
              'ملاحظات زيت الماتور',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            TextField(
              controller: oilController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'ملاحظات زيت الماتور',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
              style: const TextStyle(fontSize: 14),
            ),
            SizedBox(height: 15),
            const Text(
              'ملاحظات الترخيص',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            TextField(
              controller: exController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'ملاحظات الترخيص',
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
              style: const TextStyle(fontSize: 14),
            ),
            SizedBox(height: 30),
            GradientButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ThxDialog(
                    title: 'شكرا لك لاضافة المعلومات',
                    onTap: () {
                      Map fixMap = {
                        'oil': oilController.text,
                        'exDate': exController.text,
                        'front': frontController.text,
                        'rear': rearController.text,
                        'dis': diseController.text,
                      };
                      database.set(fixMap);
                      oilController.clear();
                      exController.clear();
                      frontController.clear();
                      rearController.clear();
                      diseController.clear();
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              title: 'تأكيد',
            )
          ],
        ),
      ),
    );
  }
}
