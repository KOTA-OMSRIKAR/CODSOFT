import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void _addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
  }

  void _editTask(int index, String newTitle) {
    setState(() {
      tasks[index].title = newTitle;
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _showTaskDialog({int? index}) {
    String dialogTitle = index == null ? 'New Task' : 'Edit Task';
    String taskTitle = index == null ? '' : tasks[index].title;
    final _textController = TextEditingController(text: taskTitle);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Title of Task '),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (index == null) {
                  _addTask(_textController.text);
                } else {
                  _editTask(index, _textController.text);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                _toggleTaskCompletion(index);
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _showTaskDialog(index: index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
