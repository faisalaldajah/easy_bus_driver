// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:easy_bus_driver/globalvariabels.dart';
import 'package:easy_bus_driver/widgets/ProgressDialog.dart';

// ignore: use_key_in_widget_constructors
class StartPage extends StatefulWidget {
  static const String id = 'startPage';

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    getCurrentDriverInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProgressDialog(
          status: 'Loading',
        ),
      ),
    );
  }
}
