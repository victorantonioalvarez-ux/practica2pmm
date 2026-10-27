import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DevProfile M3")),
      body: _createCard(),
      );
  }

  Widget _createCard(){
    return Card(
      elevation: 10,
      child: Column(
        children:[
            ListTile(
              leading: Icon(Icons.man, color: Colors.deepPurple,),
              title: Text("Full name"),
              subtitle: Text("Email"),
              trailing: Text("Birthrate"),
            ),
        ]
      )
    );
  }
}
