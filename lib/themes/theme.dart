//https://api.flutter.dev/flutter/material/ThemeData-class.html
//
// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

final appTheme = ThemeData(
  // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.red,
    accentColor: Colors.redAccent,

    // Define the default font family.
    // fontFamily: 'Georgia',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      // headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      // title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      // body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
);
