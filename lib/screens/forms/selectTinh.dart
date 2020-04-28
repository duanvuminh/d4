import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:d4/models/login.dart';

class Tinh {
  String id;
  String name;
  Tinh(String id, String name) {
    this.id = id;
    this.name = name;
  }
}

typedef StringValue = void Function(String);

class SelectTinh extends StatefulWidget {
  const SelectTinh({Key key, this.onSelectTinh}) : super(key: key);
  final StringValue onSelectTinh;
  @override
  _SelectTinh createState() => _SelectTinh();
}

class _SelectTinh extends State<SelectTinh> {
  final databaseReference = Firestore.instance;
  String tinhId;

  Future<List<Tinh>> getTinhs() {
    return databaseReference
        .collection('tinhs')
        .getDocuments()
        .then((snapshot) {
      List<Tinh> tinhs = [];
      snapshot.documents.forEach((f) {
        tinhs.add(Tinh(f.documentID,f.data["name"]));
      });
      // value = tinhs[0];
      return tinhs;
    }).catchError((error) {
      // error handle
      return new List<Tinh>();
    });
  }

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<LoginModel>(context);

    // return (DropdownButtonFormField<String>(
    //   decoration: InputDecoration(labelText: 'Tỉnh*', isDense: true),
    //   value: value.name,
    //   isDense: true,
    //   items: tinhs.map((Tinh tinh) {
    //     return new DropdownMenuItem<String>(
    //       value: tinh.name,
    //       child: new Text(tinh.name),
    //     );
    //   }).toList(),
    //   onChanged: (val) {
    //     this.setState(() {
    //       value.name = val;
    //     });
    //     login.setTinhID(val);
    //   },
    // ));

    return FutureBuilder(
        future: getTinhs(),
        builder: (BuildContext context, AsyncSnapshot<List<Tinh>> snapshot) {
          // databaseReference
          //     .collection('tinhs')
          //     .getDocuments()
          //     .then((QuerySnapshot snapshot) {
          //   snapshot.documents.forEach((f) {
          //     value = new Tinh(f.documentID, f.data["name"].toString());
          //     tinhs.add(value);
          //   });
          //   this.setState(() {
          //     value = tinhs[0];
          //   });
          // });
          if (login.getTinhID() != "") {
            tinhId = login.getTinhID();
          }
          var dropDownList = new List<DropdownMenuItem<String>>();
          if (snapshot.hasData) {
            print(snapshot.data);
            snapshot.data.forEach((Tinh tinh) {
              dropDownList.add(new DropdownMenuItem<String>(
                value: tinh.id,
                child: new Text(tinh.name),
              ));
            });
          }
          return (DropdownButtonFormField<String>(
            validator: (String val) {
              if (val==null || val.trim().isEmpty) {
                return 'Tên không được trống';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(labelText: 'Tỉnh*', isDense: true),
            value: tinhId,
            isDense: true,
            items: dropDownList,
            onChanged: (val) {
              tinhId = val;
              login.setTinhID(val);
              widget.onSelectTinh(val);
            },
          ));
        });
  }
}
