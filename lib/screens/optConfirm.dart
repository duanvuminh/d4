import 'package:flutter/material.dart';
import 'package:d4/services/authen.dart';

class OPTConfirm extends StatefulWidget {
  OPTConfirm({this.verificationId, this.name});
  final String verificationId;
  final String name;

  @override
  _OPTConfirmState createState() => _OPTConfirmState();
}

class _OPTConfirmState extends State<OPTConfirm> {
  String smsCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("OPT"),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'OPT*',
                    hintText: "Mã OPT gửi đến sdt của bạn",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onChanged: (val) {
                    smsCode = val;
                  },
                ),
                const SizedBox(height: 8.0),
                RaisedButton(
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      'Gửi',
                      style: TextStyle(color: Colors.white),
                    )),
                    onPressed: () {
                      AuthService().signInWithOTP(smsCode, widget.verificationId, widget.name);
                    }),
              ],
            )));
  }
}
