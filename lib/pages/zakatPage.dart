import 'package:flutter/material.dart';

class ZakatPage extends StatefulWidget {
  @override
  _ZakatPageState createState() => _ZakatPageState();
}

class _ZakatPageState extends State<ZakatPage> {
  TextEditingController fitrahHarga = new TextEditingController(text: '0');
  TextEditingController fitrahBarang = new TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 10.0, right: 20.0, bottom: 20.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Zakat",
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700))),
        ),
        Card(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: <Widget>[
                  Text("Zakat Fitrah"),
                  SizedBox(height: 24.0),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: fitrahHarga,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Harga Beras / KG',
                          prefixText: 'Rp.',
                      suffixText: '/kg'),
                      maxLines: 1),
                  SizedBox(height: 14.0),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Jumlah Orang',
                          suffixText: 'Orang'),
                      controller: fitrahBarang,
                      maxLines: 1),
                  SizedBox(height: 17.0),
                  RaisedButton(child: Text('Hitung'),
                    onPressed: (){
                    print(fitrahHarga.text =='');
                    final snackBar = SnackBar(
                      content: Text('Jumlah zakat yang dibayar : Rp.'+(int.parse(fitrahBarang.text) *2.5* int.parse(fitrahHarga.text)).toString()),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                        },
                      ),
                    );

                    Scaffold.of(context).showSnackBar(snackBar);
                  },)
                ]))),
        Card(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: <Widget>[
                  Text("Zakat Fitrah"),
                  SizedBox(height: 24.0),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Harga Beras',
                          prefixText: 'Rp.'),
                      maxLines: 1),
                  SizedBox(height: 14.0),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Jumlah Orang',
                          suffixText: 'Orang'),
                      maxLines: 1),
                  SizedBox(height: 17.0),
                  RaisedButton(child: Text("Hitung"))
                ]))),
      ],
    )));
  }
}
