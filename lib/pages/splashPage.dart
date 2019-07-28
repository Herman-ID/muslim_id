import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
            child: Image.asset('assets/logo.png', width: 100, height: 100)),
                Text('Muslim ID',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold),),
              ],

            ),
          ),
        ),
      ),
    );
  }

}