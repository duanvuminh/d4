import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectHuyen extends StatefulWidget {
  const SelectHuyen({Key key,this.tinhId}) : super(key: key);
  final String tinhId;
  @override
  _SelectHuyen createState() => _SelectHuyen();
}

class Huyen {
  String id;
  String name;
  Huyen(String id, String name) {
    this.id = id;
    this.name = name;
  }
}

class _SelectHuyen extends State<SelectHuyen> {
  final databaseReference = Firestore.instance;
  Huyen value;
  List<Huyen> huyens = [];
  @override
  void initState() {
    value = new Huyen("", "");
    if (widget.tinhId != "" && widget.tinhId != null) {
      databaseReference
          .collection('tinhs/' + widget.tinhId + '/huyens')
          .getDocuments()
          .then((QuerySnapshot snapshot) {
        snapshot.documents.forEach((f) {
          value = new Huyen(f.documentID, f.data["name"].toString());
          huyens.add(value);
        });
        this.setState(() {
          value = huyens[0];
        });
      }).catchError((Exception exception) {
        print(exception);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: 'Huyện*', isDense: true),
      value: value.name,
      isDense: true,
      items: huyens.map((Huyen huyen) {
        return new DropdownMenuItem<String>(
          value: huyen.name,
          child: new Text(huyen.name),
        );
      }).toList(),
      onChanged: (val) {
        this.setState(() {
          value.name = val;
        });
      },
    ));
  }
}
