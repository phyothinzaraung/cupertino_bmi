import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './util.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int unit = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Map<int, Widget> systems = const <int, Widget>{
      0: Text("Decimal"),
      1: Text("Imperial")
    };
    Util.getSettings().then(updateControl);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Settings"),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Image.network("https://bit.ly/fl_earth"),
          Util.paddingTop,
          Row(
            children: [
              SizedBox(
                width: width,
                child: CupertinoSegmentedControl(
                  children: systems,
                  groupValue: unit,
                  onValueChanged: (value) {
                    Util.saveSettings(value);
                    updateControl(value);
                  },
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  void updateControl(int value) {
    if (value != unit) {
      setState(() {
        unit = value;
      });
    }
  }
}
