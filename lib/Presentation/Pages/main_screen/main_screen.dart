import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.cWhite,
                border: Border.all(color: AppColors.cPurple, width: 2),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 3),
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: AppColors.cLightGrey),
                ],
                borderRadius: BorderRadius.all(Radius.circular(36))),
            padding: EdgeInsets.all(8),
            height: 56,
            width: size.width * 0.8,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: ListWheelScrollView(
                    onSelectedItemChanged: (s) {
                      print(s);
                    },
                    overAndUnderCenterOpacity: 0.2,
                    itemExtent: 20,
                    children: [Text('Thank'), Text('world'), Text('Tokenz')],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: ListWheelScrollView(
                    onSelectedItemChanged: (s) {
                      print(s);
                    },
                    overAndUnderCenterOpacity: 0.2,
                    itemExtent: 20,
                    children: [Text('Hello'), Text('You'), Text('From')],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: ListWheelScrollView(
                    onSelectedItemChanged: (s) {
                      print(s);
                    },
                    overAndUnderCenterOpacity: 0.2,
                    itemExtent: 20,
                    children: [Text('Cool'), Text('world'), Text('Sara')],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
