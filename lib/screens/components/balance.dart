import 'dart:ui';

import 'package:d4/localizes/d4Localizations.dart';
import 'package:flutter/material.dart';

class CBlance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "2000" + " kip",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                D4Localizations.of(context).balance,
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "This month",
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Text(
                "100 kip",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Last month",
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Text(
                "5000 kip",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),)
    );
  }
}
