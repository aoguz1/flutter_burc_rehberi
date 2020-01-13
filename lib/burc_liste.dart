import 'package:flutter/material.dart';

import 'untils/strings_info.dart';
import 'models/burc_model.dart';

class BurcListe extends StatelessWidget {
  static List<Burc> burcVeri;
  @override
  Widget build(BuildContext context) {
    burcVeri = verikaynagi();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeHazirla(),
    );
  }

  List verikaynagi() {
    List<Burc> burclar = [];

    for (var i = 0; i < 12; i++) {
      String kucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}" + ".png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}" + ".png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          buyukResim,
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          Strings.BURC_TARIHLERI[i]);

      burclar.add(eklenecekBurc);
    }

    return burclar;
  }

  Widget listeHazirla() {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return burcListelemeWidget(context, index);
      },
      itemCount: burcVeri.length,
    );
  }

  Widget burcListelemeWidget(BuildContext context, int index) {

    Burc oanlistelenen = burcVeri[index];

    return Card(
      elevation: 5,
      child: ListTile(
        onTap: (){
           Navigator.pushNamed(context, "/burcum/$index");
        },
        leading: Image.asset("images/"+oanlistelenen.burcKucukResim),
        title: Text(
          burcVeri[index].burcAdi,
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          burcVeri[index].burcTarihi,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
