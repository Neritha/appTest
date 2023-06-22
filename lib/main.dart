import 'package:flutter/material.dart';
import 'package:tuto_yt_bis/pages/add_enent_page.dart';
import 'package:tuto_yt_bis/pages/eventPage.dart';
import 'package:tuto_yt_bis/pages/homePage.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // vidéo 7 , 10:50
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) { // methode builde permet d'assembler les éléments à l'interieur
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const [
            Text("Accueil"),
            Text("Liste des conferences"),
            Text("Formulaire"),
          ][_currentIndex], // en fonction de _currentIndex qui depend de la liste
        ),
        body: [
          const HomePage(),
          const EventPage(),
          const AddEventPage(),
        ][_currentIndex],// en fonction de _currentIndex qui depend de la liste
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blueGrey,
          iconSize: 32,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Planning'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ajout'
            ),
          ]
        ) ,
      ),
    );
  }
}


