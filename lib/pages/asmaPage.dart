import 'package:flutter/material.dart';
import '../helper/asma.dart';
import '../comp/appBarInt.dart';
import '../comp/asmaulList.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class AsmaPage extends StatefulWidget {
  @override
  _AsmaPageState createState() => _AsmaPageState();
}

class _AsmaPageState extends State<AsmaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarInternal('Asmaul Husn'),
      body: Container(
          child: FutureBuilder(
        future: loadAsmaulData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            if (snapshot.data != null) {
              return ListView(children: <Widget>[
                for (var item in snapshot.data)
                  AsmaulList(item['number'].toString(), item['name'],
                      item['transliteration'], item['en']['meaning'])
              ]);
            }
          } else {
            return Center(
                child: SpinKitRing(
              color: Colors.blueAccent,
            ));
          }
        },
      )),
    );
  }
}
