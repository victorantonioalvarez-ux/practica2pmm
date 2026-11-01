import "package:flutter/material.dart";
import "package:practica2pmm/widgets/dismissible.dart";
import "package:practica2pmm/widgets/reorderable_list_view.dart";

//Usamos Stateless Widget porque esta pantalla solo muestra
//los widgets Dismissible y ReorderableListView, no necesita actualizarse
class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dismissible & ReorderableListView")),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Dismissible: desliza para eliminar"),
          ),
          Expanded(child: DismissibleList()),
          Divider(),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("ReorderableListView: arrastra para reordenar"),
          ),
          Expanded(child: FruitReorderableListView()),
        ],
      ),
    );
  }
}
