import 'package:flutter/material.dart';

class CDeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Image.asset(
                'images/unitel.png',
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            RaisedButton(
                color: Colors.red,
                child: Text("5,000",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {}),
            RaisedButton(
                color: Colors.red,
                child: Text("10,000",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Image.asset(
                'images/ltc.png',
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            RaisedButton(
                color: Colors.red,
                child: Text("20,000",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {}),
            RaisedButton(
                color: Colors.red,
                child: Text("50,000",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Image.asset(
                'images/etl.jpg',
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            RaisedButton(
                color: Colors.red,
                child: Text("100,000",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {}),
            RaisedButton(
                color: Colors.red,
                child: Text("200,000",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {}),
          ],
        )
      ],
    );
  }
}
