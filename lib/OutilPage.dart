import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Outil extends StatefulWidget {
  const Outil({super.key});
  @override
  _Outil createState() => _Outil();
}

class _Outil extends State<Outil> {

  final _formKeyVolumeL = GlobalKey<FormState>();
  final _formKeyVolumeAlcool = GlobalKey<FormState>();
  final _formKeyEBC = GlobalKey<FormState>();
  String _valeurVolumeL = "";
  String _valeurVolumeAlcool = "";
  String _valeurEBC = "";
  Column affichage = Column();

  String srmToRGB(double SRM) {
    // Returns an RGB value based on SRM
    double srm = SRM;
    double r = 0;
    double g = 0;
    double b = 0;
    if (srm >= 0 && srm <= 1) {
      r = 240;
      g = 239;
      b = 181;
    } else if (srm > 1 && srm <= 2) {
      r = 233;
      g = 215;
      b = 108;
    } else if (srm > 2) {
// Set red decimal
      if (srm < 70.6843) {
        r = 243.8327 - (6.4040 * srm) + (0.0453 * srm * srm);
      } else {
        r = 17.5014;
      }
// Set green decimal
      if (srm < 35.0674) {
        g = 230.929 - 12.484 * srm + 0.178 * srm * srm;
      } else {
        g = 12.0382;
      }
// Set blue decimal
      if (srm < 4) {
        b = -54 * srm + 216;
      } else if (srm >= 4 && srm < 7) {
        b = 0;
      } else if (srm >= 7 && srm < 9) {
        b = 13 * srm - 91;
      } else if (srm >= 9 && srm < 13) {
        b = 2 * srm + 8;
      } else if (srm >= 13 && srm < 17) {
        b = -1.5 * srm + 53.5;
      } else if (srm >= 17 && srm < 22) {
        b = 0.6 * srm + 17.8;
      } else if (srm >= 22 && srm < 27) {
        b = -2.2 * srm + 79.4;
      } else if (srm >= 27 && srm < 34) {
        b = -0.4285 * srm + 31.5714;
      } else {
        b = 17;
      }
    }
    int red = r.toInt();
    int green = g.toInt();
    int blue = b.toInt();
    String rr = red.toRadixString(16);
//red.toHexString(red);
    String gg = green.toRadixString(16);
    String bb = blue.toRadixString(16);
    String rgb = "0xFF";
    if (rr.length < 2) {
      rr = "0" + rr;
    } else if (gg.length < 2) {
      gg = "0" + gg;
    } else if (bb.length < 2) {
      bb = "0" + bb;
    }
    rgb = rgb + rr + gg + bb;
    return rgb;
  }

  Widget resultat(){
    double quantiteMalte = (int.parse(_valeurVolumeL) * int.parse(_valeurVolumeAlcool))/20;
    double volumeEauBrassage = quantiteMalte * 2.8;
    double volumeEauRincage = (int.parse(_valeurVolumeL) *  1.25 )-(volumeEauBrassage * 0.7);
    double qteHoublonAmerisant = int.parse(_valeurVolumeL)*3;
    double qteHoublonAromatique = int.parse(_valeurVolumeL)*1;
    double qteLevure = int.parse(_valeurVolumeL) / 2;
    double MCU = (4.23 * (int.parse(_valeurEBC) * quantiteMalte)) / int.parse(_valeurVolumeL);
    double EBC = 2.9396 * pow(MCU, 0.6859);
    double SRM = 0.508 * EBC;

    quantiteMalte = double.parse(quantiteMalte.toStringAsFixed(2));
    volumeEauBrassage = double.parse(volumeEauBrassage.toStringAsFixed(2));
    qteHoublonAmerisant = double.parse(qteHoublonAmerisant.toStringAsFixed(2));
    qteHoublonAromatique = double.parse(qteHoublonAromatique.toStringAsFixed(2));
    qteLevure = double.parse(qteLevure.toStringAsFixed(2));
    MCU = double.parse(MCU.toStringAsFixed(2));
    EBC = double.parse(EBC.toStringAsFixed(2));
    SRM = double.parse(SRM.toStringAsFixed(2));
    setState(() {
      affichage = Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Résultat", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),],),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Quantité de malt : "+quantiteMalte.toString()+" kg")],),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Volume eau de brassage : "+volumeEauBrassage.toString()+" L")],),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Volume eau de rinçage : "+volumeEauRincage.toString()+" L")],),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Quantité de houblon amérisant : "+qteHoublonAmerisant.toString()+" g")],),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Quantité de houblon aromatique : "+qteHoublonAromatique.toString()+" g")],),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Quantité de levure : "+qteLevure.toString()+" g")],),
          Padding(padding: EdgeInsets.all(5)),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Colorimétrie", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),],),
          Row(mainAxisAlignment:MainAxisAlignment.spaceAround ,children: [
            Column(mainAxisAlignment:MainAxisAlignment.start,children: [
              Text("MCU = "+MCU.toString()+"\nEBC = "+EBC.toString()+"\nSRM = "+SRM.toString()),
            ],),
            Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.35,
                color: Color(int.parse(srmToRGB(SRM))),
                child: Center(child:Text(srmToRGB(SRM))),
              )
            ],)
          ],),
        ],
      );
    });
    return affichage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outils de fabrication'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Form(
                  key: _formKeyVolumeL,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(5)
                          ],
                          decoration: const InputDecoration(labelText: "Volume de la production (en L)"),
                          validator: (valeur) {
                            if (valeur == null || valeur.isEmpty) {
                              return "Entrez un nombre entier";
                            } else {
                              _valeurVolumeL = valeur.toString();
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              Form(
                  key: _formKeyVolumeAlcool,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(5)
                          ],
                          decoration: const InputDecoration(labelText: "Volume d'alcool recherché (en %)"),
                          validator: (valeur) {
                            if (valeur == null || valeur.isEmpty) {
                              return "Entrez un nombre entier";
                            } else {
                              _valeurVolumeAlcool = valeur.toString();
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              Form(
                  key: _formKeyEBC,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(5)
                          ],
                          decoration: const InputDecoration(labelText: "Moyenne EBC des Grains"),
                          validator: (valeur) {
                            if (valeur == null || valeur.isEmpty) {
                              return "Entrez un nombre entier";
                            } else {
                              _valeurEBC = valeur.toString();
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  if(_formKeyVolumeL.currentState!.validate() && _formKeyVolumeAlcool.currentState!.validate() && _formKeyEBC.currentState!.validate()){
                    resultat();
                  }
                },
                child: Text(
                  'Brasser !',
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width * 0.7,
                      50,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Coins droits
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              affichage,
            ],),
          ),
      ),
    );
  }
}
