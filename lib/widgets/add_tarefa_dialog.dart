import 'package:flutter/material.dart';

class AddTarefaDialog extends StatefulWidget {
  @override
  _AddTarefaDialogState createState() => _AddTarefaDialogState();
}

class _AddTarefaDialogState extends State<AddTarefaDialog> {
  String _titulo = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Tarefa'),
      content: TextField(
        onChanged: (value) {
          setState(() {
            _titulo = value;
          });
        },
        decoration: InputDecoration(hintText: 'Digite o título da tarefa'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_titulo);
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
