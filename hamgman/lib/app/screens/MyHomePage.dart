import 'dart:io';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'start.dart';
import 'package:flutter/animation.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  Animation animation;
  Animation animationController;

  @override
  void initState(){
    super.initState();
    animationController=AnimationController(duration:Duration(seconds:4), vsync: this)..forward();
    animation = Tween(begin:1.0,end:0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn
    ));
   

  }

  @override
  Widget build(BuildContext context) {
    final double width =MediaQuery.of(context).size.width;
    return Scaffold(
          body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child:FlareActor("lib/assets/gfxanime/bear.flr", 
            animation:"test")),
            Expanded(child: AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context,Widget child){
                return Container(
                child: Transform(
                  transform: Matrix4.translationValues(animation.value *width, 0.0, 0.0),
                                  child: Column(
                    children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blueGrey)),
                      color: Colors.blue,
                      child: Text(
                        "Start GAME",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'Sriracha',
                        ),
                      ),
                      elevation: 9.0,
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => HangMan(correct:0,wrong: 0)));
                      }),
                      
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blueGrey)),
                      color: Colors.red,
                      child: Text(
                        "Quit GAME",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'Sriracha',
                        ),
                      ),
                      elevation: 9.0,
                      onPressed: () =>exit(1),
                      )]),
                ),
              );},
            ))
          ],
        ),
      ),
    );
  }
}
