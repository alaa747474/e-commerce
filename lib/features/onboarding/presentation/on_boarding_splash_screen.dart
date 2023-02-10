
import 'dart:async';


import 'package:flutter/material.dart';

import '../../auth/auth.dart';
import '../data/cache/cache_manager.dart';



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
