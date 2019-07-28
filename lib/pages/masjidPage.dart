import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:muslim_id/comp/appBarInt.dart';
import '../helper/gMap.dart';
import '../comp/masjidList.dart';

class MasjidPage extends StatefulWidget {
  @override
  _MasjidPageState createState() => _MasjidPageState();
}

class _MasjidPageState extends State<MasjidPage> {
  List data;
  List vdata;

  String error;
  LocationData _currentLocation;
  double lng;
  double lat;
  StreamSubscription<LocationData> _locationSubscription;
  var _locationService = new Location();
  bool isLoading = false;
  String id;

  void loadLocation() async {
    try {
      _currentLocation = await _locationService.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == "PERMISSION_DENIED_NEVER_ASK") {
        error = 'Permission denied';
      }
      _currentLocation = null;
    }
    if (_currentLocation != null) {
      if (mounted) {
        setState(() {
          isLoading = true;
          lat = _currentLocation.latitude;
          lng = _currentLocation.longitude;
        });
      }
    }
  }

  void initState() {
    loadLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarInternal('Masjid'),
        body: Container(
            child: FutureBuilder(
                future: getMasjidData(lat, lng),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    if (snapshot.data != null) {
                      return ListView(children: <Widget>[
                        for (var item in snapshot.data)
                          MasjidList(
                              item['name'], item['icon'], item['vicinity'], () {
                            launchGoogle(
                                item['geometry']['location']['lat'],
                                item['geometry']['location']['lng'],
                                lat,
                                lng,
                                item['name']);
                          })
                      ]); //Do stuff and build your screen from this method
                    }
                  } else {
                    return Center(
                        child: SpinKitRing(
                      color: Colors.blueAccent,
                    ));
                  }
                })));
  }
}
