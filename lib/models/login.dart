// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class LoginModel extends ChangeNotifier {
  LoginModel(String tinhId) {
    _tinhID = tinhId;
  }
  String _tinhID="";
  void setTinhID(String id) {
    this._tinhID = id;
    notifyListeners();
  }
  String getTinhID(){
    return this._tinhID;
  }
}
