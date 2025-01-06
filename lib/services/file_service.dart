import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tarefa.dart';

class FileService {
  static const String _keyTarefas = 'tarefas';

  // Salvar tarefas no shared_preferences
  Future<void> salvarTarefas(List<Tarefa> tarefas) async {
    final prefs = await SharedPreferences.getInstance();
    final dadosJson =
        jsonEncode(tarefas.map((tarefa) => tarefa.toMap()).toList());
    await prefs.setString(_keyTarefas, dadosJson);
  }

  // Carregar tarefas do shared_preferences
  Future<List<Tarefa>> carregarTarefas() async {
    final prefs = await SharedPreferences.getInstance();
    final dadosJson = prefs.getString(_keyTarefas);

    if (dadosJson != null) {
      List<dynamic> jsonData = jsonDecode(dadosJson);
      return jsonData
          .map((item) => Tarefa.fromMap(Map<String, String>.from(item)))
          .toList();
    } else {
      return [];
    }
  }
}
