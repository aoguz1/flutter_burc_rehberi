import 'package:burc_rehberi/burc_liste.dart';
import 'package:burc_rehberi/models/burc_model.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenindexdegeri;
  BurcDetay(this.gelenindexdegeri);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}



class _BurcDetayState extends State<BurcDetay> {
  Burc gelenburcdegeri;
  PaletteGenerator paletrengi;
  Color baskinrenk;


 @override
  void initState() { 
    super.initState();
     gelenburcdegeri = BurcListe.burcVeri[widget.gelenindexdegeri];
     //baskinrenkbul(); // baskinrenk bul fonksiyonunu cihazlarda çalıştırıldığında detay sayfasına giderken kasma problemi oluyor. Bu hatanın çözümünü öğrendiğimde hatayı gidereceğim 
     
    
  }

  void baskinrenkbul() {
    Future<PaletteGenerator> palettegenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + gelenburcdegeri.burcBuyukResim));
    palettegenerator.then((value) {
      paletrengi = value;

      debugPrint(paletrengi.dominantColor.color.toString());
        
      setState(() {
        baskinrenk = paletrengi.dominantColor.color;
      });
    });
  }

 



  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: Text(gelenburcdegeri.burcAdi + " Burcu ve Özellikleri"),
        pinned: true,
        primary: true,
       backgroundColor: baskinrenk != null ? baskinrenk : Colors.teal,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            "images/" + gelenburcdegeri.burcBuyukResim,
            fit: BoxFit.cover,
          ),
        ),
        expandedHeight: 250,
        
      ),
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.teal.shade50,
            ),
            child: Text(
              gelenburcdegeri.burcDetayi,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
      )
    ]));
  }
}
