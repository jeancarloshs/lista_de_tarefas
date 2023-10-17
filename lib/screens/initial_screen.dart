// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/task.dart';
import 'package:lista_de_tarefas/data/task_dao.dart';
import 'package:lista_de_tarefas/data/task_inherited.dart';
import 'package:lista_de_tarefas/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              
            });
          }, icon: const Icon(Icons.refresh))
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading...'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading...'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading...'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task tarefa = items[index];
                        return tarefa;
                      },
                    );
                  }
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Icon(Icons.error_outline),
                        ),
                        Text(
                          'Não há nenhuma Tarefa!!!',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  );
                }
                // return const Text('Erro ao carregar tarefas');
                break;
            }
            return const Text('Erro desconhecido!!!');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
            print('Recarregando a tela inicial');
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
