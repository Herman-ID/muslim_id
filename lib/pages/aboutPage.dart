import 'package:flutter/material.dart';
import 'package:muslim_id/comp/appBarInt.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarInternal('Tentang Kami'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Muslim ID', style: Theme.of(context).textTheme.headline,),
              Container(height: 20.0),
              Text('Muslim ID adalah aplikasi untuk kebutuhan agama islam, dibuat dengan prakarsa Mahasiswa Universitas Siliwangi Tasikmalaya yaitu Herman Sugiharto dan Jajang Khairil Azhar.',
              style: Theme.of(context).textTheme.body2),
              Container(height: 40.0),
              Row(children: <Widget>[
                Image.asset('assets/unsil.png', height: 55.0, width: 55.0),
                Container(width: 20.0),
                Image.asset('assets/logo.png', height: 55.0, width: 55.0),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
