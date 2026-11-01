import "package:flutter/material.dart";

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dismissible & ReorderableListView")),
      body: const Column(
        children:[
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Dismissible: desliza para eliminar")
          )
          Expanded(child: DismissibleList()),
          Divider(),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("ReorderableListView: arrastra para reordenar")
          )
          Expanded(child: ReorderableListView())]
      ),
    );
  }
}