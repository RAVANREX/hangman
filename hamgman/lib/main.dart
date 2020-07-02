import 'package:flutter/material.dart';
import 'app/screens/MyHomePage.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hangman App',
        home: SplashScreen.navigate(
          name:'lib/assets/gfxanime/stayhome.flr',
          next:(_)=>MyHomePage(),
          until:()=>Future.delayed(Duration(seconds: 8)),
          startAnimation: 'Animation',
                

           )
            );
  }
}

  