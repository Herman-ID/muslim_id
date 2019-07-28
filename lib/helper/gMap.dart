import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void launchGoogle(lat, long, lat1, long1, nama) async {
  if (Platform.isAndroid) {
    var mapSchema = 'geo:${lat.toString()},${long.toString()}?q=${nama}';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  } else {
    String url = "https://www.google.com/maps/dir/?api=1&origin=" +
        lat1.toString() +
        ", " +
        long1.toString() +
        "&destination=" +
        lat.toString() +
        ", " +
        long.toString() +
        "&travelmode=driving&dir_action=navigate";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

Future<List> getMasjidData(lat, lng) async {
  if (lng != null && lat != null) {
    http.Response respon = await http.get(
        Uri.encodeFull(
            'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
                lat.toString() +
                ',' +
                lng.toString() +
                '&radius=1500&type=mosque&key=AIzaSyDwDaQqbzgcPsyLN5yHAeK2bKo2BZiqGGY'),
        headers: {
          "Accept": "Application/json",
        });
    print('https://api.pray.zone/v2/times/today.json?longitude=' +
        lng.toString() +
        '&latitude=' +
        lat.toString() +
        '&elevation=333');
    Map dat = json.decode(respon.body);
    List mdata = dat["results"];

    return mdata;
  }
}
