import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/logo.png',width: 100,),
          SizedBox(height: 16,),
          CircularProgressIndicator(),
        ],
      ))
    );
  }
}
