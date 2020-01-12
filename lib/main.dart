



import 'package:burc_rehberi/burc_liste.dart';
import 'package:flutter/material.dart';

import 'burc_detay.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
          "/" :  (context) => BurcListe(),
          "/burcListesi" : (context)=> BurcListe(),
      },
      onUnknownRoute: (RouteSettings settings)=> MaterialPageRoute(builder: (context)=> BurcListe()),
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathelemanlari = settings.name.split("/");  // /detayBurc/$index     işlemden sonra  / detayBurc / $index  split paçalıyor 

        if (pathelemanlari[1] == "burcum") {
          return MaterialPageRoute(builder: (context)=> BurcDetay(int.parse(pathelemanlari[2])));
        }
        else{
          return null;
        }
      },


      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: 'Material App',
      //home: BurcListe(),
    );
  }
}