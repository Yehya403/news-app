import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/my_theme_data.dart';
import 'package:news_app/ui/splash/splash_screen.dart';

import 'di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemeData.myThemeLight,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
