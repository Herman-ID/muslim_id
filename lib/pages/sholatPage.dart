import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class SholatPage extends StatefulWidget {
  @override
  _SholatPageState createState() => _SholatPageState();
}

class _SholatPageState extends State<SholatPage> {
  var data = new Map();

  String error;
  LocationData _currentLocation;
  double lng;
  double lat;
  StreamSubscription<LocationData> _locationSubscription;
  var _locationService = new Location();
  bool isLoading = false;
  String id;

  Future<String> getData() async {
    print(lat);
    if(this.lng != null && this.lat != null) {
      http.Response respon = await http.get(
          Uri.encodeFull(
              'https://api.pray.zone/v2/times/today.json?longitude='+this.lng.toString()+'&latitude='+this.lat.toString()+'&elevation=333'),
          headers: {"Accept": "Application/json",});

      setState(() {
        data = json.decode(respon.body);
      });
      print(respon.body);
      return "success";
    }
  }

  void loadLocation() async {

    print('do');
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
      print('oy');
      if (mounted) {
        setState(() {
          isLoading = true;
          lat = _currentLocation.latitude;
          lng = _currentLocation.longitude;
        });
        this.getData();
      }
    }
  }
  void initState() {
    loadLocation();
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return lat == null ? Center (child: SpinKitRing(color: Colors.blueAccent,)) : Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://source.unsplash.com/collection/1411907/900x1600'),
                fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.multiply)
            )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Subuh',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['items'] != null
                              ? data["items"][0]["fajr"]
                              : lat.toString(),
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Subuh',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['items'] != null
                              ? data["items"][0]["fajr"]
                              : 'fajr',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Subuh',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['items'] != null
                              ? data["items"][0]["fajr"]
                              : 'fajr',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Subuh',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['items'] != null
                              ? data["items"][0]["fajr"]
                              : 'fajr',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Subuh',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['items'] != null
                              ? data["items"][0]["fajr"]
                              : 'fajr',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
