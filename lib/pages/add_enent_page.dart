import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  final _formKey = GlobalKey<FormState>(); // systeme de global key  permet de garder le statue du formulaire

  final confNameController = TextEditingController();
  final speakerNameContrommer = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    confNameController.dispose();
    speakerNameContrommer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const  InputDecoration(
                  labelText: 'Nom conference',
                  hintText: 'Entrez le nom de la conference',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty ){
                    return "vous devez completer ce champ";
                  }
                  return null;
                },
                controller: confNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const  InputDecoration(
                  labelText: 'Nom speaker',
                  hintText: 'Entrez le nom du speaker',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty ){
                    return "vous devez completer ce champ";
                  }
                  return null;
                },
                controller: speakerNameContrommer,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: 'talk',
                    child: Text("talk show") ,
                  ),
                  DropdownMenuItem(
                    value: 'art',
                    child: Text("artistique et culturel") ,
                  ),
                  DropdownMenuItem(
                    value: 'professionnelle',
                    child: Text("professionelle") ,
                  ),
                ], 
                decoration: const InputDecoration(
                  border : OutlineInputBorder(),
                ),
                value: selectedConfType,
                onChanged: (value){
                  setState(() {
                    selectedConfType = value!;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'choisir une date',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedConfDate = value;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity, // pour que le btn prenne le plus de place possible en largeur
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()){
                    final confName = confNameController.text;
                    final speakerName = speakerNameContrommer.text;

                    ScaffoldMessenger.of(context).showSnackBar( 
                      const SnackBar(content: Text("Envoi en cours ..."))  // petit message temporaire
                    );
                    FocusScope.of(context).requestFocus(FocusNode());
                    
                    // ajout dans la base de données
                    CollectionReference eventsRef = FirebaseFirestore.instance.collection("Events");
                    eventsRef.add({
                      'speaker' : speakerName,
                      'dateD' : selectedConfDate,
                      'subject' : confName,
                      'avatar' : 'img1',
                      'type' : selectedConfType,
                    });
        

                  }
                }, 
                child: const Text("Envoyer")
              ),
            ),
          ],
        )
      ),
    );
  }
}