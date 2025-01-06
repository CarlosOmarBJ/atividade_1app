import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tarefa.dart';

class SharedPreferencesService {
  static const String _keyTarefas =
      'tarefas'; // Chave para armazenar as tarefas

  // Salvar tarefas no SharedPreferences
  Future<void> salvarTarefas(List<Tarefa> tarefas) async {
    final preferencias = await SharedPreferences.getInstance();
    // Converte a lista de tarefas para JSON
    final dadosJson =
        jsonEncode(tarefas.map((tarefa) => tarefa.toMap()).toList());
    await preferencias.setString(
        _keyTarefas, dadosJson); // Salva como String no SharedPreferences
  }

  // Carregar tarefas do SharedPreferences
  Future<List<Tarefa>> carregarTarefas() async {
    final preferencias = await SharedPreferences.getInstance();
    final dadosJson = preferencias.getString(_keyTarefas);
    if (dadosJson != null) {
      // Converte o JSON de volta para uma lista de tarefas
      List<dynamic> jsonData = jsonDecode(dadosJson);
      return jsonData
          .map((item) => Tarefa.fromMap(Map<String, String>.from(item)))
          .toList();
    }
    return []; // Retorna uma lista vazia se não houver dados
  }
}
