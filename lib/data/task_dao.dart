import 'package:lista_de_tarefas/components/task.dart';
import 'package:lista_de_tarefas/data/database.dart';
import 'package:sqflite/sqflite.dart';

// DAO significa Data Access Object, traduzido para o português, seria objeto de acesso a dados.

class TaskDao {
  static const String _tableName = 'taskTable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT, '
      ')';

  save(Task tarefa) async {}

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDedados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDedados.query(_tableName);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo toList: ');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  // Future<List<Task>> find(String nome) async {}
  delete(String nomeDaTarefa) async {}
}
