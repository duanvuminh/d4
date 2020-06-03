import 'package:d4/localizes/d4Localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:d4/utils/unitiesClass.dart';
import 'package:d4/models/user_model.dart';

class OPTConfirm extends StatefulWidget {
  @override
  _OPTConfirmState createState() => _OPTConfirmState();
}

class _OPTConfirmState extends State<OPTConfirm> {
  String smsCode;

  @override
  Widget build(BuildContext context) {
    var userRepository = Provider.of<UserRepository>(context);
    final Agrs args = ModalRoute.of(context).settings.arguments;
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
                  decoration: InputDecoration(
                    labelText: 'OPT*',
                    hintText: D4Localizations.of(context).optHint,
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
                      D4Localizations.of(context).optConfirm,
                      style: TextStyle(color: Colors.white),
                    )),
                    onPressed: () {
                      userRepository.setHandset(args.handset);
                      userRepository
                          .signInWithOTP(smsCode, args.verificationId)
                          .then((AuthResult auth) {
                        // save user with name
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', (Route<dynamic> route) => false);
                      });
                    }),
              ],
            )));
  }
}
