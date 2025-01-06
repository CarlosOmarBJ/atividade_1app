import 'package:flutter/material.dart';
import '../models/tarefa.dart';
import '../services/file_service.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  List<Tarefa> tarefas = [];
  final FileService _fileService = FileService();

  @override
  void initState() {
    super.initState();
    _carregarTarefas(); // Carregar tarefas ao iniciar
  }

  Future<void> _carregarTarefas() async {
    List<Tarefa> tarefasCarregadas = await _fileService.carregarTarefas();
    setState(() {
      tarefas = tarefasCarregadas;
    });
  }

  void _adicionarTarefa(String titulo) {
    setState(() {
      tarefas.add(Tarefa(titulo: titulo));
    });
    _salvarTarefas(); // Atualizar o arquivo
  }

  void _excluirTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
    _salvarTarefas(); // Atualizar o arquivo
  }

  Future<void> _salvarTarefas() async {
    await _fileService.salvarTarefas(tarefas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tarefas[index].titulo),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _excluirTarefa(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? titulo = await _mostrarDialogoAdicionarTarefa();
          if (titulo != null && titulo.isNotEmpty) {
            _adicionarTarefa(titulo);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<String?> _mostrarDialogoAdicionarTarefa() {
    TextEditingController controller = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Tarefa'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Título da tarefa'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
