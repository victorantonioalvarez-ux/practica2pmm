import 'package:flutter/material.dart';

// Uso StatefulWidget para poder actualizar la lista cuando se elimina un elemento

class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  final List<String> _games = [
    "Caves of Qud",
    "S.T.A.L.K.E.R.",
    "Hollow Knight",
    "Dwarf Fortress",
    "The Witcher 3",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _games.length,
      itemBuilder: (context, index) {
        final game = _games[index];
        return Dismissible(
          key: Key(game),
          background: Container(
            color: Colors.purple,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            setState(() {
              _games.removeAt(index);
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$game eliminado")));
          },
          child: ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: Text(game),
          ),
        );
      },
    );
  }
}
