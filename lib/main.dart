import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:d4/screens/home.dart';
import 'package:d4/screens/login.dart';
import 'package:d4/screens/register.dart';
import 'package:d4/screens/optConfirm.dart';
import 'package:d4/services/unitiesClass.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) {
              return StreamBuilder(
                  stream: FirebaseAuth.instance.onAuthStateChanged,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return DashboardPage();
                    } else {
                      return LoginPage();
                    }
                  });
            });
          case 'register':
            return MaterialPageRoute(builder: (_) {
              return StreamBuilder(
                  stream: FirebaseAuth.instance.onAuthStateChanged,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return DashboardPage();
                    } else {
                      return RegisterPage();
                    }
                  });
            });
          case 'opt':
            return MaterialPageRoute(builder: (_) {
              return StreamBuilder(
                  stream: FirebaseAuth.instance.onAuthStateChanged,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return DashboardPage();
                    } else {
                      var args = settings.arguments as Agrs;
                      return OPTConfirm(
                          verificationId: args.verificationId,
                          name: args.name);
                    }
                  });
            });
          default:
            {
              return MaterialPageRoute(builder: (_) {
                return StreamBuilder(
                    stream: FirebaseAuth.instance.onAuthStateChanged,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        return DashboardPage();
                      } else {
                        return LoginPage();
                      }
                    });
              });
            }
        }
      },
    );
  }
}
