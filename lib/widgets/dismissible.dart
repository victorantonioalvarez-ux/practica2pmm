import 'package:flutter/material.dart';

// Uso StatefulWidget para poder actualizar la lista cuando se elimina un elemento
 
class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  final List<String> _tasks = [
    "Tarea 1",
    "Tarea 2",
    "Tarea 3",
    "Tarea 4",
    "Tarea 5",
  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final task = _tasks[index];
        return Dismissible(
          key: Key(task),
          background: Container(
            color: Colors.purple,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
            onDismissed: (direction){
              setState(() {
                _tasks.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$task eliminado"))
              );
            },
            child: ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: Text(task),
          ),
        );
      },
    );
  }
}
