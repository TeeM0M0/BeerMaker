import 'package:flutter/material.dart';
import 'dart:async';

//permet la création du splashscreen au lancement de l'application
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

//splashscreen de 3 secondes avec le logo et un CircularProgressIndicator qui renvoie sur la page d'acceuil
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Acceuil())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("Assets/BeerMakerRessources/bgor.png"),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: Image.asset(
                'Assets/BeerMakerRessources/BMLogo/beermakerlogo350.png',
                width: 300,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 350.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//page d'acceuil avec un menu de navigation et deux boutons qui renvoit soit sur la page statistique ou personnalisé
class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/BeerMakerRessources/Bbg.gif"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'Assets/BeerMakerRessources/BMLogo/beermakerlogo350.png',
                    width: 250,
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(50)),
              SizedBox(
                width: 300.0,
                height: 100.0,
                child: ElevatedButton(
                  child: Text('Etapes de fabrication',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/etapes');
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.black),
                    backgroundColor: Color.fromARGB(0, 22, 44, 33),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                width: 300.0,
                height: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/outil');
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.black),
                    backgroundColor: Color.fromARGB(0, 22, 44, 33),
                  ),
                  child: const Text('Outil de fabrication',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
