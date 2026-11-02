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

  DateTime _birthdate = DateTime.now();

  late Persona _persona;

  bool _loaded = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  void _pickDate() {
    showDatePicker(
      context: context,
      initialDate: _birthdate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          _birthdate = picked;
          _birthdateController.text =
              "${picked.month.toString().padLeft(2, "0")}/${picked.day.toString().padLeft(2, "0")}/${picked.year}";
        });
      }
    });
  }

  void _save() {
    if (_firstNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Rellena todos los campos")));
      return;
    }

    _persona.firstName = _firstNameController.text.trim();
    _persona.lastName = _lastNameController.text.trim();
    _persona.email = _emailController.text.trim();
    _persona.password = _passwordController.text;
    _persona.birthdate = _birthdate;

    Navigator.pop(context, _persona);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      _persona = ModalRoute.of(context)!.settings.arguments as Persona;
      _firstNameController.text = _persona.firstName;
      _lastNameController.text = _persona.lastName;
      _emailController.text = _persona.email;
      _passwordController.text = _persona.password;
      _birthdate = _persona.birthdate;
      _birthdateController.text =
          "${_birthdate.month.toString().padLeft(2, "0")}/${_birthdate.day.toString().padLeft(2, "0")}/${_birthdate.year}";
      _loaded = true;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Álvarez -Editar perfil")),
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
              keyboardType: TextInputType.emailAddress,
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
              readOnly: true,
              onTap: _pickDate,
              decoration: const InputDecoration(
                labelText: 'Birthdate',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save and Return'),
            ),
          ],
        ),
      ),
    );
  }
}
