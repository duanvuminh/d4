import 'package:flutter/material.dart';
import 'package:d4/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:d4/services/authen.dart';
import 'package:d4/services/unitiesClass.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Spacer(),
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset('images/logo.png',
                  cacheWidth: 100, cacheHeight: 100),
            ),
            const SizedBox(height: 32.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'ISDN*',
                prefixText: '020-',
                prefixIcon: Icon(Icons.person),
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
            ),
            // const SizedBox(height: 16.0),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Mật khẩu*',
            //     hintText: ">= 8 ký tự",
            //     prefixIcon: Icon(Icons.lock),
            //   ),
            //   validator: (String value) {
            //     if (value.trim().length < 8) {
            //       return 'Mật khẩu lớn hơn 8 kí tự';
            //     } else if (value
            //         .trim()
            //         .contains(new RegExp(r'^.*[a-zA-Z]{1,}[0-9]{1,}.*$'))) {
            //       return 'Mật khẩu không đúng định dạng';
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            // Row(children: <Widget>[
            //   const Spacer(),
            //   FlatButton(child: new Text('Quên mật khẩu'), onPressed: () {})
            // ]),
            const SizedBox(height: 16.0),
            RaisedButton(
                color: Colors.red,
                child: Center(
                    child: Text(
                  'Đăng nhập',
                  style: TextStyle(color: Colors.white),
                )),
                onPressed: _submit),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    const Spacer(),
                    Icon(
                      Icons.phone_forwarded,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: SelectableText.rich(
                          TextSpan(
                            text:
                                'Tổng đài chăm sóc khách hàng', // default text style
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' 08023607047 '
                              )
                            ],
                          ),
                        )),
                    const Spacer()
                  ],
                )),
          ],
        ),
      ),
      const Spacer(),
      Padding(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: Column(
          children: <Widget>[
            Text('Chưa có tài khoản'),
            const SizedBox(height: 16.0),
            FlatButton(
                child: new Text('Đăng kí'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                }),
            const SizedBox(height: 16.0),
          ],
        ),
      )
    ]);
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
      Navigator.pushNamed(context, "opt",arguments: agrs);
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      // this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 25),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
