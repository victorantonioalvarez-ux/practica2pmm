import 'package:flutter/material.dart';
import 'package:practica2pmm/models/persona.dart';

// Usamos StatefulWidget porque guardamos el estado de los campos de texto
// y queremos que se actualicen cuando se edite el perfil
class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});


  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text ("Editar perfil")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'FirstName',
              border: OutlineInputBorder(),
            ),
            ),

            const SizedBox(height: 16),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'LastName',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: 'Birthdate',
                border: OutlineInputBorder(),
              ),
            ),

          ],
        )
      )
    );
    
  }
}