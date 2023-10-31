import 'package:flutter/material.dart';
import 'package:foodcort/SignUp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String pageName='/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splash(){
    Future.delayed(Duration(seconds: 4),() {
       
       Navigator.pushReplacementNamed(context, SignUPPage.pageName);
    },);
  }
  @override
  void initState() {
    super.initState();
    splash();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(200, 37, 35, 35),
      body: Stack(
        children:[ 
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashimage.jpg'),fit: BoxFit.fill)
        ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Opacity(
              opacity: 0.7,
              child: Text(
              'Food Cort Service',
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w700,
              
              fontSize: 24,
              
              fontStyle: FontStyle.italic),),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_circle_down_rounded,color: Colors.amber,),
          ),
        )
        ]
      ),
    );
  }
}