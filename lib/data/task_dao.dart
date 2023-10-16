import 'package:lista_de_tarefas/components/task.dart';

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
  Future<List<Task>> findAll() async {}
  Future<List<Task>> find(String nome) async {}
  delete(String nomeDaTarefa) async {}
}
