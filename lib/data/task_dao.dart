// ignore_for_file: avoid_print

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
      '$_image TEXT)';

  save(Task tarefa) async {
    print('Acessando o saveOrUpdate: ');
    final Database bancoDeDados = await getDataBase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa não existia.');
      return await bancoDeDados.insert(_tableName, taskMap);
    } else {
      print('A tarefa já existia.');
      return await bancoDeDados.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> mapaDeTarefas = {}; // É o mesmo que utilizar Map(); está sendo usado de forma literal
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de tarefa: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo toList: ');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
      );
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando o find: ');
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print(
        'Procurando dados no banco de dados... Encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Acessando o delete: ');
    final Database bancoDeDados = await getDataBase();
    return bancoDeDados.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
