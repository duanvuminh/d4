import 'dart:ui';

import 'package:d4/localizes/d4Localizations.dart';
import 'package:flutter/material.dart';

class CBlance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "2000" + " kip",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                D4Localizations.of(context).balance,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}
