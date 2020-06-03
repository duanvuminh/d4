import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:d4/models/login.dart';

typedef StringValue = void Function(String);
class SelectHuyen extends StatefulWidget {
  const SelectHuyen({Key key, this.onSelectHuyen}) : super(key: key);
  final StringValue onSelectHuyen;
  @override
  _SelectHuyen createState() => _SelectHuyen();
}

class _SelectHuyen extends State<SelectHuyen> {
  final databaseReference = Firestore.instance;
  String huyenId;
  Future<List<String>> getHuyens() {
    var login = Provider.of<LoginModel>(context);
    if (login.getTinhID() != null) {
      return databaseReference
          .collection('tinhs/' + login.getTinhID() + '/huyens')
          .getDocuments()
          .then((snapshot) {
        List<String> huyens = [];
        snapshot.documents.forEach((f) {
          huyens.add(f.data["name"]);
        });
        // huyenId = huyens[0];
        return huyens;
      }).catchError((error) {
        // error handle
        return new List<String>();
      });
    } else {
      return new Future<List<String>>.value();
    }
  }

  @override
  Widget build(BuildContext context) {
    // var tinhId = login.tinhID;
    // if (tinhId != null) {
    //   databaseReference
    //       .collection('tinhs/' + tinhId + '/huyens')
    //       .getDocuments()
    //       .then((QuerySnapshot snapshot) {
    //     snapshot.documents.forEach((f) {
    //       value = new Huyen(f.documentID, f.data["name"].toString());
    //       huyens.add(value);
    //     });
    //     value = huyens[0];
    //   }).catchError((Exception exception) {
    //     print(exception);
    //   });
    // }
    return FutureBuilder(
        future: getHuyens(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          var dropDownList = new List<DropdownMenuItem<String>>();
          if (snapshot.hasData) {
            snapshot.data.forEach((String name) {
              dropDownList.add(new DropdownMenuItem<String>(
                value: name,
                child: new Text(name),
              ));
            });
          }
          return DropdownButtonFormField<String>(
              validator: (String val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Tên không được trống';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(labelText: 'Huyện*', isDense: true),
              value: huyenId,
              isDense: true,
              items: dropDownList,
              onChanged: (val) {
                this.setState((){
                  huyenId = val;
                });
                widget.onSelectHuyen(val);
              });
        });
  }
}
