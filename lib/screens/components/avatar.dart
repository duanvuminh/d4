import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class CAvatar extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final bool custom;
  CAvatar(
      {this.width = 50,
      this.height = 50,
      this.radius = 20,
      this.custom = false});
  // CAvatar.customSize(this.width,this.height);
  @override
  Widget build(BuildContext context) {
    return CircularProfileAvatar(
//                  'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWtMDksH9GzFdMinyAkGbtLJNx6xynLETTNN5akjxirL3QD5Rj',
      errorWidget: (context, url, error) => Container(
        child: Icon(Icons.error),
      ),
      placeHolder: (context, url) => Container(
        width: this.width,
        height: this.height,
        child: CircularProgressIndicator(),
      ),
      radius: this.radius,
      backgroundColor: Colors.transparent,
      borderWidth: 2,
//                  initialsText: Text(
//                    "AD",
//                    style: TextStyle(fontSize: 40, color: Colors.white),
//                  ),
      borderColor: Colors.teal,
      elevation: 5.0,
      onTap: () {
        if (this.custom) {
        } else {
          Navigator.pushNamed(context, "mypage");
        }
      },
      cacheImage: true,
      showInitialTextAbovePicture: false,
    );
  }
}
