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

  void _editProfile() {
    Navigator.pushNamed(context, "/edit", arguments: _persona).then((updated) {
      if (updated is Persona) {
        setState(() {
          _persona = updated;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DevProfile M3")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [_createCard()],
      ),
    );
  }

  Widget _createCard() {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.man, color: Colors.deepPurple),
            title: Text(_persona.fullName),
            subtitle: Text(_persona.email),
            trailing: Text(_persona.birthdateFormatted),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ElevatedButton(
                onPressed: _editProfile,
                child: const Text("Edit Profile"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/widgets");
                },
                child: const Text("Explore Widget Showcase"),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
