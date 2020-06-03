import 'package:d4/screens/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:d4/screens/home.dart';
import 'package:d4/screens/login.dart';
import 'package:d4/screens/loading.dart';
import 'package:d4/screens/opt_confirm.dart';
import 'package:d4/themes/theme.dart';
import 'package:d4/models/user_model.dart';
import 'package:d4/localizes/d4Localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) {
            var userRepository = Provider.of<UserRepository>(context);
            if (userRepository.status == Status.Authenticated) {
              return DashboardPage();
            } else if (userRepository.status == Status.Uninitialized) {
              return LoadingPage();
            } else {
              return LoginPage();
            }
          },
          "opt": (context) => OPTConfirm(),
          "mypage": (context) => MyPage(),
        },
        theme: appTheme,
        localizationsDelegates: [
          const D4LocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('vi', ''),
        ],
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserRepository(),
        )
      ],
    );
  }
}

// export PATH="$PATH:/Users/vuduan/Public/code/flutter/bin"
