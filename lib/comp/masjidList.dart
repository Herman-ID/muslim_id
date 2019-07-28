import 'package:flutter/material.dart';

class MasjidList extends StatelessWidget {
  final String nama;
  final String alamat;
  final GestureTapCallback tap;
  final String icon;
  MasjidList(this.nama, this.icon, this.alamat, this.tap);

  @override
  Widget build(BuildContext context) {
    return Material(
                      child: InkWell(
                        onTap: tap,
                        child: ListTile(
                          title: Text(
                            nama,
                            style: Theme.of(context).textTheme.title,
                          ),
                          leading: Image.network(
                            icon,
                            width: 30.0,
                            height: 30.0,
                          ),
                          subtitle: Text(alamat,
                              style: Theme.of(context).textTheme.subtitle),
                        ),
                      ),
                    );
  }
}