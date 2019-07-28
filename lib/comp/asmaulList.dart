import 'package:flutter/material.dart';

class AsmaulList extends StatelessWidget {
  final String number;
  final String title;
  final String meaning;
  final String name;
  AsmaulList(this.number, this.name, this.title, this.meaning);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          leading: Text(
            number + '.',
            style: Theme.of(context).textTheme.headline,
          ),
          subtitle: Text(name + ' - ' + meaning,
              style: Theme.of(context).textTheme.subtitle),
        ),
      ),
    );
  }
}
