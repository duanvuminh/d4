import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:d4/services/authen.dart';
// import 'package:d4/screens/forms/selectTinh.dart';
// import 'package:d4/screens/forms/selectHuyen.dart';
import 'package:d4/models/login.dart';

import 'package:provider/provider.dart';
import 'package:d4/services/unitiesClass.dart';


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String verificationId, smsCode;
  LoginModel model = LoginModel();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => LoginModel())],
        child: Column(children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset('images/logo.png',
                      cacheWidth: 100, cacheHeight: 100),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ISDN*',
                    prefixText: '020-',
                  ),
                  validator: (String value) {
                    if (value.trim().length != 8) {
                      return 'ISDN không đúng định dạng';
                    } else if (value[0] != '2' && value[0] != '5') {
                      return 'ISDN không đúng định dạng';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String val) {
                    model.isdn = val;
                  },
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Tên*', hintText: "Tối đa 20 kí tự"),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Tên không được trống';
                    } else if (value.trim().length > 20) {
                      return 'Tối đa 20 kí tự';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String val) {
                    model.name = val;
                  },
                ),
                // const SizedBox(height: 8.0),
                // SelectTinh(
                //   onSelectTinh: (String val) {
                //     model.tinhID = val;
                //   },
                // ),
                // const SizedBox(height: 8.0),
                // SelectHuyen(
                //   onSelectHuyen: (String val) {
                //     model.huyenID = val;
                //   },
                // ),
                // const SizedBox(height: 8.0),
                // TextFormField(
                //   decoration: const InputDecoration(
                //       labelText: 'Mật khẩu*', hintText: ">= 8 ký tự"),
                //   validator: (String value) {
                //     if (value == null || value.trim().length < 8) {
                //       return 'Mật khẩu lớn hơn 8 kí tự';
                //     } else if (value
                //         .trim()
                //         .contains(new RegExp(r'^.*[a-zA-Z]{1,}[0-9]{1,}.*$'))) {
                //       return 'Mật khẩu không đúng định dạng';
                //     } else {
                //       return null;
                //     }
                //   },
                //   onChanged: (val) {
                //     model.pass = val;
                //   },
                // ),
                // const SizedBox(height: 8.0),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: 'Đánh lại mật khẩu*',
                //   ),
                //   validator: (String value) {
                //     if (value == null || value.trim().length < 8) {
                //       return 'Mật khẩu lớn hơn 8 kí tự';
                //     } else if (value
                //         .trim()
                //         .contains(new RegExp(r'^.*[a-zA-Z]{1,}[0-9]{1,}.*$'))) {
                //       return 'Mật khẩu không đúng định dạng';
                //     } else {
                //       return null;
                //     }
                //   },
                //   onChanged: (val) {
                //     model.rePass = val;
                //   },
                // ),
                const SizedBox(height: 8.0),
                RaisedButton(
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      'Đăng kí',
                      style: TextStyle(color: Colors.white),
                    )),
                    onPressed: _submit),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: <Widget>[
                        const Spacer(),
                        Icon(Icons.phone_forwarded),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: SelectableText.rich(
                              TextSpan(
                                text:
                                    'Tổng đài chăm sóc khách hàng', // default text style
                                children: <TextSpan>[
                                  TextSpan(text: ' 08023607047 ')
                                ],
                              ),
                            )),
                        const Spacer()
                      ],
                    )),
              ],
            ),
          ),
          const Spacer()
        ]));
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      verifyPhone("+1 650-555-3434");
    }
  }

   Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      Agrs agrs = new Agrs();
      agrs.verificationId = verId;
      agrs.name = model.name;
      Navigator.pushNamed(context, "opt",arguments: agrs);
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
  
}
