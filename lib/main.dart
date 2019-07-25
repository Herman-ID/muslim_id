import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:muslim_id/pages/homePage.dart';
import 'package:muslim_id/pages/kabahPage.dart';
import 'package:muslim_id/pages/morePage.dart';
import 'package:muslim_id/pages/sholatPage.dart';
import 'package:muslim_id/pages/zakatPage.dart';
import 'package:muslim_id/pages/nointernet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim ID',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Muslim ID'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;

  final ZakatPage _zakat = ZakatPage();
  final SholatPage _sholat = SholatPage();
  final NoInternet _more = NoInternet();
  final KabahPage _kabah = KabahPage();
  final HomePage _home = HomePage();

  Widget _showPage = new HomePage();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
        break;
      case 1:
        return _sholat;
        break;
      case 2:
        return _kabah;
        break;
      case 3:
        return _zakat;
        break;
      case 4:
        return _home;
        break;
      default:
        return new Container(
            child: new Center(child: new Text(page.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _page,
          items: <Widget>[
            Icon(Icons.home,
                size: 24, color: _page == 0 ? Colors.black : Colors.grey),
            Icon(Icons.access_alarm,
                size: 24, color: _page == 1 ? Colors.black : Colors.grey),
            Icon(Icons.gps_fixed,
                size: 24, color: _page == 2 ? Colors.black : Colors.grey),
            Icon(Icons.card_giftcard,
                size: 24, color: _page == 3 ? Colors.black : Colors.grey),
            Icon(Icons.menu,
                size: 24, color: _page == 4 ? Colors.black : Colors.grey),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
              _showPage = _pageChooser(index);
            });
          },
        ),
        body: SafeArea(
          child: Container(
              child: _showPage,
              ),
        ));
  }
}
