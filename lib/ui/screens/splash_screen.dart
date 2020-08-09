import 'dart:async';

import 'package:currency_convert_app/utilites/constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget _screen;
  SplashScreen(this._screen);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => widget._screen)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                  Color(0xff6391ff).withOpacity(0),
                  Color(0xff6391ff).withOpacity(0.3),
                  Color(0xff6391ff).withOpacity(0.6),
                  Color(0xff6391ff).withOpacity(0.9),
                ])),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.monetization_on,
                    size: 160,
                  ),
                  radius: 75,
                ),

                SizedBox(
                  height: 30,
                ),
                RichText(
                    text: TextSpan(
                        text: getTranslateValue(context, 'app_title')[0],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6391ff).withOpacity(0.9)),
                        children: [
                      TextSpan(
                        text: getTranslateValue(context, 'app_title').substring(1),
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ])),
                // SizedBox(
                //   height: 100,
                // ),
                Transform.translate(
                  offset: Offset(0, 170),
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xff6391ff),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
