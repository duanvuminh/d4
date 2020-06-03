import 'package:d4/models/user_model.dart';
import 'package:d4/screens/components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  @override
  createState() {
    return _MyPage();
  }
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    var userRepository = Provider.of<UserRepository>(context);
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Card(
          elevation: 0,
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.close,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CAvatar(
                      radius: 50,
                      custom: true,
                    ),
                  ]),
              const SizedBox(height: 20),
              ListTile(
                onTap: () {
                  userRepository.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', (Route<dynamic> route) => false);
                },
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                //trailing: Icon(Icons.more_vert),
              ),
            ],
          ),
        )));
  }
}
