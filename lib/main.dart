import 'package:cupertino_bmi/bmi.dart';
import 'package:cupertino_bmi/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const<LocalizationsDelegate>[
        DefaultMaterialLocalizations.delegate,
      ],
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
              ),
              title: Text("BMI")),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.settings_solid,
              ),
              title: Text("Settings")),
        ],
      ),
      tabBuilder: (BuildContext context, int i) {
        if (i == 0) {
          return Bmi();
        } else {
          return Settings();
        }
      },
    );
  }
}
