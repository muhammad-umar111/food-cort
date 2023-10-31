import 'package:flutter/material.dart';
import 'package:foodcort/SignIn.dart';
import 'package:foodcort/SignUp.dart';
import 'package:foodcort/splashscreen.dart';

Route generateRoute(RouteSettings settings){
  if (settings.name==SplashScreen.pageName) {
    return MaterialPageRoute(builder: (context) {
      return const SplashScreen();
    },);
  } else if(settings.name==SignInPage.pageName){
    return MaterialPageRoute(builder: (context) {
      return const SignInPage();
    },);
  }else{
  return MaterialPageRoute(builder: (context) {
      return const SignUPPage();
    },);
  }
}