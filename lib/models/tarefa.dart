class Tarefa {
  String titulo;

  Tarefa({required this.titulo});

  // Converte para um mapa JSON-compatível
  Map<String, String> toMap() {
    return {'titulo': titulo};
  }

  // Constrói uma tarefa a partir de um mapa
  factory Tarefa.fromMap(Map<String, String> map) {
    return Tarefa(titulo: map['titulo'] ?? '');
  }
}
