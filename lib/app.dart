import 'package:flutter/material.dart';
import 'package:flutter_application_1/onBoarding.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:get/get.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoarding(),
    );
  }
}