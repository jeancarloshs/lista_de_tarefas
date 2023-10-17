import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/difficulty.dart';
import 'package:lista_de_tarefas/data/task_dao.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {super.key});

  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromARGB(213, 207, 220, 236),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(5)),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: assetOrNetwork()
                                ? Image.asset(
                                    widget.foto,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    widget.foto,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: const TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Difficulty(
                              levelDifficulty: widget.dificuldade,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: ElevatedButton(
                            onLongPress: () {
                              showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deletar'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Deletar',
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.delete_forever, size: 30),
                    ],
                  ),
                  const Text('Tem certeza que deseja deletar essa Tarefa?', style: TextStyle(fontSize: 20),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Não', style: TextStyle(fontSize: 18),),
                      ),
                      // const SizedBox(width: 2,),
                      TextButton(
                        onPressed: () {
                          TaskDao().delete(widget.nome);
                          Navigator.pop(context); // Fecha o AlertDialog após a ação.
                        },
                        child: const Text('Sim', style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );});
                            },
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text('LvL UP',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                      Text(
                        'Nivel: ${widget.nivel}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
