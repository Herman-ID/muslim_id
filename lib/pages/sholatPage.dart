import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SholatPage extends StatefulWidget {
  @override
  _SholatPageState createState() => _SholatPageState();
}

class _SholatPageState extends State<SholatPage> {
  var data = new Map();
  Future<String> getData() async {
    http.Response respon = await http.get(
        Uri.encodeFull(
            'http://muslimsalat.com/tasikmalaya.json?key=%20ecb5ac8a7870cecb59cfdcf51921e263'),
        headers: {"Accept": "Application/json"});

    setState(() {
      data = json.decode(respon.body);
    });
    return "success";
  }

  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    print(data["items"]);
    return Container(
        child: Card(
            child: Column(
      children: <Widget>[
        Row(children: <Widget>[
          Column(children: <Widget>[
            Text(data["city"] != null ? data["city"] : "nama kota"),
            Text(data["items"] != null
                ? data["items"][0]["date_for"]
                : "tanggal")
          ])
        ]),
        Row(children: <Widget>[
          Expanded(child: Text("Shubuh")),
          Expanded(
              child: Text(
                  data["items"] != null ? data["items"][0]["fajr"] : "tanggal"))
        ]),
        Row(children: <Widget>[
          Expanded(child: Text("Fajar")),
          Expanded(
              child: Text(data["items"] != null
                  ? data["items"][0]["shurooq"]
                  : "tanggal"))
        ]),
        Row(children: <Widget>[
          Expanded(child: Text("Dzuhur")),
          Expanded(
              child: Text(data["items"] != null
                  ? data["items"][0]["dhuhr"]
                  : "tanggal"))
        ]),
        Row(children: <Widget>[
          Expanded(child: Text("Ashar")),
          Expanded(
              child: Text(
                  data["items"] != null ? data["items"][0]["asr"] : "tanggal"))
        ]),
        Row(children: <Widget>[
          Expanded(child: Text("Maghrib")),
          Expanded(
              child: Text(data["items"] != null
                  ? data["items"][0]["maghrib"]
                  : "tanggal"))
        ]),
        Row(children: <Widget>[
          Expanded(child: Text("Isya")),
          Expanded(
              child: Text(
                  data["items"] != null ? data["items"][0]["isha"] : "tanggal"))
        ]),
      ],
    )));
  }
}
