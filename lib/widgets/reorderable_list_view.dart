import 'package:flutter/material.dart';

class FruitReorderableListView extends StatefulWidget {
  const FruitReorderableListView({super.key});
 
  @override
  State<FruitReorderableListView> createState() => _FruitReorderableListViewState();
}
 
class _FruitReorderableListViewState extends State<FruitReorderableListView> {
  final List<String> _fruits = [
    "Manzanas",
    "Peras",
    "Plátanos",
    "Naranjas",
    "Fresas",
  ];
 
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: _fruits.length,
      itemBuilder: (context, index) {
        final fruit = _fruits[index];
        return ListTile(
          key: Key(fruit),
          leading: const Icon(Icons.food_bank),
          title: Text(fruit),
          trailing: const Icon(Icons.drag_handle),
        );
      },
      onReorderItem: (oldIndex, newIndex) {
        setState(() {
          final fruit = _fruits.removeAt(oldIndex);
          _fruits.insert(newIndex, fruit);
        });
      },
    );
  }
}

