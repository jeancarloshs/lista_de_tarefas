import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tarefas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Tarefas'),
          ),
          body: ListView(
            children: const [
              Task('Tarefa 1'),
              Task('Tarefa 2'),
              Task('Tarefa 3'),
              Task('Tarefa 4'),
              Task('Tarefa 5'),
              Task('Tarefa 6'),
              Task('Tarefa 7'),
              Task('Tarefa 8'),
              Task('Tarefa 9'),
              Task('Tarefa 10'),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('clicou');
            },
            child: const Text('+'),
          ),
        ));
  }
}

class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromARGB(213, 207, 220, 236),
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        nome,
                        style: const TextStyle(fontSize: 24),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.arrow_drop_up)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
