import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  final todoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            key: Key('TaskTile_$index'),
            task: tasks[index],
            onChanged: (value) {
              setState(() {
                tasks[index].isCompleted = value!;
              });
            },
            onDelete: () {
              setState(() {
                tasks.removeAt(index);
              });
            },
          );
        },
      ),
      
      floatingActionButton: Row(
        children: [
          const SizedBox(width: 32),
          Expanded(
            child: TextField(
              key: const Key('txt_toDoListDesc'),
              controller: todoController,
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              if(todoController.text.trim().isEmpty){
                todoController.clear();
              }else {
              setState(() {
                tasks.add(Task(title: todoController.text));
              });
              todoController.clear();}
            },
            key: const Key('btn_add'),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}


class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        key: const Key('chk_taskDesc'),
        task.title,
        style: TextStyle(
          decoration: (task.isCompleted) ? TextDecoration.lineThrough : TextDecoration.none
        ),
      ),
      subtitle: task.description != null ? Text(task.description!) : null,
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: onChanged,
        key: const Key('chk_checkbox')
      ),
      trailing: IconButton(
        key: const Key('ico_delete'),
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}

class Task {
  final String title;
  final String? description;
  bool isCompleted;

  Task({required this.title, this.description, this.isCompleted = false});
}
