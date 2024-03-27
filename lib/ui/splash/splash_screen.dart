import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashSC";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset("assets/images/logo.png"),
          ),
        )
      ],
    );
  }
}
