// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FixTab extends StatefulWidget {
  FixTab({Key key}) : super(key: key);

  @override
  State<FixTab> createState() => _FixTabState();
}

class _FixTabState extends State<FixTab> {
  bool value0 = false;
  bool value1 = false;
  bool value2 = false;

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
                value: value0,
                onChanged: (bool value) {
                  setState(() {
                    value0 = value;
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
                value: value1,
                onChanged: (bool value) {
                  setState(() {
                    value1 = value;
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
                value: value2,
                onChanged: (bool value) {
                  setState(() {
                    value2 = value;
                    print(value2);
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
