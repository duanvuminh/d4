import 'package:flutter/material.dart';
import 'package:d4/screens/forms/selectTinh.dart';
import 'package:d4/screens/forms/selectHuyen.dart';
import 'package:d4/models/login.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginModel(""))
    ],
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
          ),
          const SizedBox(height: 16.0),
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
          ),
          const SizedBox(height: 16.0),
          SelectTinh(),
          const SizedBox(height: 16.0),
          SelectHuyen(),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Mật khẩu*', hintText: ">= 8 ký tự"),
            validator: (String value) {
              if (value.trim().length < 8) {
                return 'Mật khẩu lớn hơn 8 kí tự';
              } else if (value
                  .trim()
                  .contains(new RegExp(r'^.*[a-zA-Z]{1,}[0-9]{1,}.*$'))) {
                return 'Mật khẩu không đúng định dạng';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Đánh lại mật khẩu*',
            ),
            validator: (String value) {
              if (value.trim().length < 8) {
                return 'Mật khẩu lớn hơn 8 kí tự';
              } else if (value
                  .trim()
                  .contains(new RegExp(r'^.*[a-zA-Z]{1,}[0-9]{1,}.*$'))) {
                return 'Mật khẩu không đúng định dạng';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 16.0),
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
                          children: <TextSpan>[TextSpan(text: ' 08023607047 ')],
                        ),
                      )),
                  const Spacer()
                ],
              )),
        ],
      ),
    ),
    const Spacer()
    ])
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      const SnackBar snackBar = SnackBar(content: Text('Form submitted'));

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}
