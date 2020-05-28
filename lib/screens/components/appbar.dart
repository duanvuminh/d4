import 'package:flutter/material.dart';
import 'avatar.dart';

class CAppbar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: CAvatar(),
          )
          
        ],
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);

} 