import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:libpray/libpray.dart';

class SholatPage extends StatefulWidget {
  @override
  _SholatPageState createState() => _SholatPageState();
}

class _SholatPageState extends State<SholatPage> {
  var data = new Map();
  List vdata;

  String error;
  LocationData _currentLocation;
  double lng;
  double lat;
  StreamSubscription<LocationData> _locationSubscription;
  var _locationService = new Location();
  bool isLoading = false;
  String id;

  Future<String> getData() async {
    if(this.lng != null && this.lat != null) {
      final PrayerCalculationSettings settings = PrayerCalculationSettings((PrayerCalculationSettingsBuilder b) =>
      b..calculationMethod.replace(CalculationMethod.fromPreset(preset: CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia)));

      final DateTime when = DateTime.now();
        final Geocoordinate geo = Geocoordinate((GeocoordinateBuilder b) => b
    ..latitude = lat
    ..longitude = lng);
  const double timezone = 7.0;
   final Prayers prayers = Prayers.on(date: when, settings: settings, coordinate: geo, timeZone: timezone);
  print(prayers.imsak);
  print(prayers.fajr);
  print(prayers.sunrise);
  print(prayers.dhuha);
  print(prayers.dhuhr);
  print(prayers.asr);
  print(prayers.sunset);
  print(prayers.maghrib);
  print(prayers.isha);
  print(prayers.midnight);
      // http.Response respon = await http.get(
      //     Uri.encodeFull(
      //         'https://api.pray.zone/v2/times/today.json?longitude='+this.lng.toString()+'&latitude='+this.lat.toString()+'&elevation=333'),
      //     headers: {"Accept": "Application/json",});
      // print('https://api.pray.zone/v2/times/today.json?longitude='+this.lng.toString()+'&latitude='+this.lat.toString()+'&elevation=333');
      // Map dat = json.decode(respon.body);
      // Map mdata = dat["results"]['datetime'][0]['times'];
      // List xdat = mdata.values.toList();
      // setState(() {
      //   data = dat["results"]['datetime'][0]['times'];
      //   vdata = xdat;
      // });
      // for (String i in xdat) {
      //   List time = i.split(':');
      //   var timenow = DateTime.now();
      //   var oy = TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1]));
      //   var x = DateTime(timenow.year, timenow.month, timenow.day, oy.hour, oy.minute);
      //   print(x.difference(timenow).toString());
      // } 
      // return "success";
    }
  }

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
        this.getData();
      }
    }
  }
  void initState() {
    loadLocation();
  }

  @override
  Widget build(BuildContext context) {
    return data['Imsak']== null ? Center (child: SpinKitRing(color: Colors.blueAccent,)) : Container(
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
                        'Imsak',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['Imsak'] != null
                              ? data["Imsak"]
                              : 'Loading...',
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
                          data['Fajr'] != null
                              ? data["Fajr"]
                              : 'Loading...',
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
                        'Dzuhur',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['Dhuhr'] != null
                              ? data["Dhuhr"]
                              : 'Loading...',
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
                        'Ashar',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['Asr'] != null
                              ? data["Asr"]
                              : 'Loading...',
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
                        'Maghrib',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['Maghrib'] != null
                              ? data["Maghrib"]
                              : 'Loading...',
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
                        'Isya',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                          data['Isha'] != null
                              ? data["Isha"]
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
