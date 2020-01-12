import 'package:burc_rehberi/burc_liste.dart';
import 'package:burc_rehberi/models/burc_model.dart';
import 'package:flutter/material.dart';

class BurcDetay extends StatelessWidget {
  int gelenindexdegeri;

  Burc gelenBurcDeger;

  BurcDetay(this.gelenindexdegeri);

  @override
  Widget build(BuildContext context) {
    gelenBurcDeger = BurcListe.burcVeri[gelenindexdegeri];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.asset("images/" + gelenBurcDeger.burcBuyukResim),
            ),
            title: Text(gelenBurcDeger.burcAdi + "Burcu ve Özellikleri"),
            pinned: false,
            primary: true,
          )
        ],
      ),
    );
  }
}
