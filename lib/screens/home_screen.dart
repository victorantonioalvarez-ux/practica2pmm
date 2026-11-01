import 'package:flutter/material.dart';
import 'package:practica2pmm/models/persona.dart';

// Usamos StatefulWidget para poder actualizar la pantalla cuando se edite el perfil

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Persona _persona = Persona(
    firstName: "Víctor",
    lastName: "Álvarez",
    email: "vac@gmail.com",
    password: "1234",
    birthdate: DateTime(1999, 10, 19),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DevProfile M3")),
      body: _createCard(context),
      );
  }

  Widget _createCard(BuildContext context){
    return Card(
      elevation: 10,
      child: Column(
        children:[
            ListTile(
              leading: Icon(Icons.man, color: Colors.deepPurple,),
              title: Text(_persona.fullName),
              subtitle: Text(_persona.email),
              trailing: Text(_persona.birthdateFormatted),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/edit");
                }, child: const Text("Edit Profile")),
                SizedBox(width: 12,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/widgets");
                }, child: const Text("Explore Widget Showcase")),

              ],
            )
        ]
      )
    );
  }
}
