import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List> loadAsmaulData() async {
  http.Response respon = await http
      .get(Uri.encodeFull('https://api.aladhan.com/asmaAlHusna'), headers: {
    "Accept": "Application/json",
  });
  Map dat = json.decode(respon.body);
  List mdata = dat["data"];
  return mdata;
}
