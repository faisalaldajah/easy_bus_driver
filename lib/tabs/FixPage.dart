// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FixTab extends StatefulWidget {
  FixTab({Key key}) : super(key: key);

  @override
  State<FixTab> createState() => _FixTabState();
}

class _FixTabState extends State<FixTab> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: value,
                onChanged: (bool value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
              const SizedBox(width: 20),
              const Text('تعبئة الزيت', style: TextStyle(fontSize: 25))
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (bool value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
              const SizedBox(width: 20),
              const Text('تعبئة البنزين', style: TextStyle(fontSize: 25))
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (bool value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
              const SizedBox(width: 20),
              const Text('الغسيل', style: TextStyle(fontSize: 25))
            ],
          ),
        ],
      ),
    );
  }
}
