# Lista de Tarefas - Aplicativo Flutter

## Descrição do Projeto
Este projeto é um aplicativo simples de **Lista de Tarefas** desenvolvido em **Flutter**. O aplicativo permite que o usuário adicione, visualize e exclua tarefas. As tarefas são armazenadas localmente no dispositivo utilizando a biblioteca **shared_preferences**, garantindo que os dados persistam mesmo que o aplicativo seja fechado e reaberto.

---

## Tecnologias Utilizadas

- **Linguagem de Programação**: Dart
- **Framework**: Flutter
- **Gerenciamento de Dependências**: pubspec.yaml
- **Bibliotecas Utilizadas**:
  - `shared_preferences`: Para armazenar dados localmente no dispositivo em formato JSON.

---

## Funcionalidades do Aplicativo

1. **Adicionar Tarefa**:
   - Permite ao usuário adicionar uma nova tarefa com um título.
   - As tarefas adicionadas são imediatamente salvas no armazenamento local.

2. **Listar Tarefas**:
   - Exibe todas as tarefas adicionadas em uma lista.

3. **Excluir Tarefa**:
   - O usuário pode remover uma tarefa clicando no ícone de lixeira correspondente.
   - As alterações são refletidas e salvas imediatamente no armazenamento local.

4. **Persistência de Dados**:
   - Utiliza o `shared_preferences` para salvar e carregar a lista de tarefas em formato JSON.
   - Garante que as tarefas persistam após o fechamento e reabertura do aplicativo.

Vídeo: https://www.youtube.com/watch?v=B74JxVd8GtU
