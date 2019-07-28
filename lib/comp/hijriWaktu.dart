import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/umm_alqura_calendar.dart';

class HijriWaktu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://source.unsplash.com/collection/1411907/900x1600'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.multiply))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                          DateFormat('yyyy-MM-dd – kk:mm')
                              .format(new DateTime.now()),
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.0)),
                      Text(new ummAlquraCalendar.now().toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18.0))
                    ],
                  ),
                ),
              ),
            );
            
  }
}