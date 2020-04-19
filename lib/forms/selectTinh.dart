import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

typedef StringValue = void Function(String);

class SelectTinh extends StatefulWidget {
  const SelectTinh({Key key,this.onSelectTinh}) : super(key: key);
  final StringValue onSelectTinh;
  @override
  _SelectTinh createState() => _SelectTinh();
}

class Tinh {
  String id;
  String name;
  Tinh(String id, String name) {
    this.id = id;
    this.name = name;
  }
}

class _SelectTinh extends State<SelectTinh> {
  final databaseReference = Firestore.instance;
  Tinh value;
  List<Tinh> tinhs = [];
  @override
  void initState() {
    value= new Tinh("", "");
    databaseReference
        .collection('tinhs')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        value = new Tinh(f.documentID, f.data["name"].toString());
        tinhs.add(value);
      });
      this.setState(() {
          value = tinhs[0];
          widget.onSelectTinh(value.name);
        });
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: 'Tỉnh*', isDense: true),
      value: value.name,
      isDense: true,
      items: tinhs.map((Tinh tinh) {
        return new DropdownMenuItem<String>(
          value: tinh.name,
          child: new Text(tinh.name),
        );
      }).toList(),
      onChanged: (val) {
        this.setState(() {
          value.name = val;
        });
        widget.onSelectTinh(val);
      },
    ));
  }
}
