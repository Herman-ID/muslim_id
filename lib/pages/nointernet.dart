import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5FAFF),
      child: Column(
        children: <Widget>[
          Image.asset('assets/nointernet.png',height: MediaQuery.of(context).size.height * 0.3,),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'KONEKSI HILANG',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF605270)),
                  ),
                  Container(height: 20.0),
                  Text(
                    'Mohon maaf, anda tidak memiliki koneksi, mohon aktifkan koneksi dan coba lagi.',
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF605270)),
                  ),
                  Container(height: 60.0),
                  CupertinoButton(
                    child: Text('COBA LAGI'),
                    onPressed: () {},
                    color: Color(0xFF605270),
                  )
                ],
              ))
        ],
      ),
    );;
  }
}
