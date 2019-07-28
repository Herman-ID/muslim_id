import 'package:flutter/material.dart';

class AppBarInternal extends StatelessWidget  with PreferredSizeWidget{
  final String title;
  AppBarInternal(this.title);


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      );
  }
}