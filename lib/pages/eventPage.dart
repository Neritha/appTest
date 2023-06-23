//import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  //final events = [ //liste qui ne varrira pas lors de l'execution du programme ( on lui donne toute les conference qui aurons lieux ) on utilise le système du dictonnaire (clef->valeur)

  //]; 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Events").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData){
            return const Text("aucune conferences");
          }

          List<dynamic> events = [];
          snapshot.data!.docs.forEach((element) { 
            events.add(element);
          });
          
          return ListView.builder(
            itemCount: events.length,// indique le nombre d'item à l'interieur de la liste
            itemBuilder: (context, index){// permet de resseptionner le context acctuel aisi que l'index de l'item dans la liste
              final event = events[index];
              final avatar = event['avatar'].toString().toLowerCase(); //ont donne la clef de l'avatar pour relier à l'image
              final name = event['speaker'];
              final Timestamp timestamp = event['dateD'];
              final String  time = DateFormat.yMd().add_jm().format(timestamp.toDate()); 
              final subject = event['subject'];

              return Card(
                child: ListTile(
                  leading: Image.asset("assets/images/$avatar.png"), //correspond à la varriable final avatar dans le builder
                  title: Text('$name ($time)'),
                  //title: Text('$name'),
                  subtitle: Text('$subject'),
                  trailing: const Icon(Icons.more_vert),
                ),
              );
            }, 
          );
        } ,
      )
    );
  }
}