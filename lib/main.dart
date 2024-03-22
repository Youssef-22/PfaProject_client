import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'onBoarding.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Wrap your MaterialApp with GetMaterialApp
      title: 'Your App',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoarding() // Your initial screen or home
    );
  }
}
