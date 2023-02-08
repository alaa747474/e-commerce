
import 'dart:async';

import 'package:e_commerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce_app/features/onboarding/data/cache/cache_manager.dart';

import 'package:flutter/material.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    CacheManger().onboardingCaching();
   Timer(const Duration(seconds: 3),()=>Navigator.pushReplacementNamed(context, LoginScreen.routeName));
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:Center(
        child: Image.asset('assets/images/logo.png',width: 150,height: 250,color: Colors.white,),
    ),
    );
  }
}
