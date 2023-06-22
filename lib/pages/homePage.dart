import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: unused_import
import 'eventPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Image.asset("assets/images/frog.png"),
          const Text(
            "ConfWorld 2022",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'Poppins',
            ),
          ),
          const Text(
            "Salon virtuel de conferences singulières du 23 au 25 juin 2023",
            style: TextStyle(
              fontSize: 24
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          /*ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
              padding: MaterialStatePropertyAll(EdgeInsets.all(20)) // padding dans le btn
            ),
            onPressed: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const EventPage(), // rediretion en fonction de la route et du context
                )
              );
            }, 
            child: 
            const Text("afficher le planning",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )*/
        ],
      )
    );
  }
}