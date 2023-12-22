import 'strings.dart';
import 'package:flutter/material.dart';

class Etapes extends StatefulWidget {
  const Etapes({super.key});
  @override
  _Etapes createState() => _Etapes();
}

class _Etapes extends State<Etapes> {

  int page = 0;
  Widget texte = Container();

  Widget affichage() {
    switch (page) {
      case 0:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape00titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape00_01),
            Text(etape00_02),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape00_03),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step00.png',
              width: 250,),
          ],
          ),
        );
      case 1:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape01titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape01_01),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape01_02),
            Padding(padding: EdgeInsets.all(5)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step10.png',
              width: 250,),
            Text(etape01_03),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape01_04),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step11.png',
              width: 250,),
          ],
          ),
        );
      case 2:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape02titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape02_01),
            Text(etape02_02),
            Padding(padding: EdgeInsets.all(5)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step20.png',
              width: 150,),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape02_03),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step21.png',
              width: 250,),
          ],
          ),
        );
      case 3:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape03titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape03_01),
            Padding(padding: EdgeInsets.all(5)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step30.png',
              width: 250,),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape03_02),
            Padding(padding: EdgeInsets.all(5)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step31.png',
              width: 250,),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape03_03),
          ],
          ),
        );
      case 4:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape04titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape04_01),
            Padding(padding: EdgeInsets.all(5)),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape04_02),
            Padding(padding: EdgeInsets.all(5)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step40.png',
              width: 250,),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape04_03),
          ],
          ),
        );
      case 5:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape05titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape05_01),
            Padding(padding: EdgeInsets.all(5)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step50.png',
                width: 150,),
              Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step51.png',
                width: 150,),
            ],),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape05_02),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape05_03),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step52.png',
              width: 250,),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape05_04),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape05_05),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape05_06),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape05_07),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step53.png',
              width: 250,),
          ],
          ),
        );
      case 6:
        texte = texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape06titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape06_01),
            Padding(padding: EdgeInsets.all(5)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step60.png',
              width: 250,),
          ],
          ),
        );
      case 7:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape07titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(etape07_01),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape07_02),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape07_03),
            Padding(padding: EdgeInsets.all(5)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step70.png',
              width: 250,),
            Padding(padding: EdgeInsets.all(5)),
            Text(etape07_04),
            Text(etape07_05),
          ],
          ),
        );
      case 8:
        texte = Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(etape08titre)],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Image.asset( 'Assets/BeerMakerRessources/BeerMaker_step/step80.png',
              width: 250,),
          ],
          ),
        );
    }
    return texte;
  }

  void nextPage(){
    setState(() {
      if(page<8){
        page++;
      }else{
        page=0;
      }
      affichage();
    });
  }

  void prevPage(){
    setState(() {
      if(page>0){
        page--;
      }else{
        page=8;
      }
      affichage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Etapes'),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
            child: Container(
              child: affichage(),
            )
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.orange,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: prevPage,
                child: Image.asset(
                  'Assets/BeerMakerRessources/previous.png',
                ),
              ),
              TextButton(
                onPressed: nextPage,
                child: Image.asset(
                  'Assets/BeerMakerRessources/next.png',
                ),
              )
            ],
          ),
        ));
  }
}
