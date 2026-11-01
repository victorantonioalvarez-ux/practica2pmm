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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }
  

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
            controller: _firstNameController,
            decoration: const InputDecoration(
              labelText: 'FirstName',
              border: OutlineInputBorder(),
            ),
            ),

            const SizedBox(height: 16),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'LastName',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              controller: _birthdateController,
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