import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
              title: Text("Full name"),
              subtitle: Text("Email"),
              trailing: Text("Birthrate"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: (){
                  Navigator.pushNamed(context, "/edit");
                }, child: const Text("Editar"))
              ],
            )
        ]
      )
    );
  }
}
