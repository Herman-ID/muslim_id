import 'dart:ui';

import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final String gambar;

  MenuCard(this.title, this.onTap, this.gambar);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                    image: NetworkImage(gambar),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.multiply))),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white, fontSize: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
