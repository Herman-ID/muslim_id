import 'package:flutter/material.dart';
import 'aboutPage.dart';
import 'kabahPage.dart';
import 'syahadatPage.dart';
import 'asmaPage.dart';
import 'masjidPage.dart';
import '../comp/menuCard.dart';
import '../comp/hijriWaktu.dart';

class BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            HijriWaktu(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: <Widget>[
                    MenuCard('masjid', () {
                      Route route =
                          MaterialPageRoute(builder: (context) => MasjidPage());
                      Navigator.push(context, route);
                    }, 'https://source.unsplash.com/collection/1411907/900x1600'),
                    MenuCard('Qiblat', () {
                      Route route =
                          MaterialPageRoute(builder: (context) => KabahPage());
                      Navigator.push(context, route);
                    }, 'https://source.unsplash.com/collection/1411907/900x1600'),
                    MenuCard('Asmaul Husna', () {
                      Route route =
                          MaterialPageRoute(builder: (context) => AsmaPage());
                      Navigator.push(context, route);
                    }, 'https://source.unsplash.com/collection/1411907/900x1600'),
                    MenuCard('Syahadat', () {
                      Route route =
                          MaterialPageRoute(builder: (context) => Syahadat());
                      Navigator.push(context, route);
                    }, 'https://source.unsplash.com/collection/1411907/900x1600'),
                    MenuCard('Tentang Kami', () {
                      Route route =
                          MaterialPageRoute(builder: (context) => AboutPage());
                      Navigator.push(context, route);
                    }, 'https://source.unsplash.com/collection/1411907/900x1600'),
                  ]),
            )
          ],
        ));
  }
}
