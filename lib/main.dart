import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'onBoarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Wrap your MaterialApp with GetMaterialApp
      title: 'Your App',
      theme: ThemeData(
        // Your app theme
      ),
      home: OnBoarding() // Your initial screen or home
    );
  }
}
