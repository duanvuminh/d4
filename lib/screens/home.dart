import 'package:d4/screens/components/deal.dart';
import 'package:flutter/material.dart';
import 'package:d4/services/authen.dart';

import 'package:d4/screens/components/appbar.dart';

import 'components/balance.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CAppbar(),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[Expanded(child: CBlance())],
              ),
              const SizedBox(height:16),
              CDeal()
            ],
          ),
        ));
  }
}
