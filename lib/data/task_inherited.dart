import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task('Tarefa 1', 'assets/images/1.png', 0),
    Task('Tarefa 2', 'assets/images/2.png', 3),
    Task('Tarefa 3', 'assets/images/3.jpg', 1),
    Task('Tarefa 4', 'assets/images/4.jpg', 5),
    Task('Tarefa 5', 'assets/images/5.jpg', 4),
    Task('Tarefa 6', 'assets/images/6.jpg', 1),
    Task('Tarefa 7', 'assets/images/7.jpg', 3),
    Task('Tarefa 8', 'assets/images/8.jpg', 2),
    Task('Tarefa 9', 'assets/images/9.jpg', 4),
    Task('Tarefa 10', 'assets/images/10.png', 5),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
