import 'package:flutter/material.dart';

import 'package:mvvm/view_model/services/splashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.chechAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Welcome to splashScreen.',
        style: TextStyle(fontSize: 25, color: Colors.red),
      )),
    );
  }
}
