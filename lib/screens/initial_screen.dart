import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/task.dart';

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
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
            Task(
                'Tarefa 1',
                'assets/images/1.png',
                0),
            Task(
                'Tarefa 2',
                'assets/images/2.png',
                3),
            Task(
                'Tarefa 3',
                'assets/images/3.jpg',
                1),
            Task(
                'Tarefa 4',
                'assets/images/4.jpg',
                5),
            Task('Tarefa 5',
                'assets/images/5.jpg', 4),
            Task(
                'Tarefa 6',
                'assets/images/6.jpg',
                1),
            Task(
                'Tarefa 7',
                'assets/images/7.jpg',
                3),
            Task(
                'Tarefa 8',
                'assets/images/8.jpg',
                2),
            Task('Tarefa 9',
                'assets/images/9.jpg', 4),
            Task(
                'Tarefa 10',
                'assets/images/10.png',
                5),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
