import 'package:flutter/material.dart';
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
        centerTitle: true,
        title: const Text('Tarefas'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: context,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
