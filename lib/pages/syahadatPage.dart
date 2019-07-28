import 'package:flutter/material.dart';
import 'package:muslim_id/comp/appBarInt.dart';

class Syahadat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarInternal('Syahadat'),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/syahadat.jpg', width: MediaQuery.of(context).size.width * 0.8,),
              Container(height: 20.0),
              Text('ʾašhadu ʾal lā ilāha illa l-Lāh wa ʾašhadu ʾanna muḥammadar rasūlu l-Lāh', style: TextStyle(fontSize: 19.0), textAlign: TextAlign.center,),
              Container(height: 20.0),
              Text('Saya bersaksi bahwa tiada Ilah selain Allah dan saya bersaksi bahwa Muhammad adalah rasul (utusan) Allah.', style: TextStyle(fontSize: 19.0), textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );

  }
}