import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class TarefaItem extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback onDelete;

  TarefaItem({required this.tarefa, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tarefa.titulo),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
