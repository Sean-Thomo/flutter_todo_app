import 'package:flutter/material.dart';
import 'item_widget.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ItemWidget(
          key: ValueKey(index),
          task: tasks[index].title, // Pass the task title
          isDone: tasks[index].isDone, // Pass the completion state
          onChanged: (value) {
            // Handle checkbox state change
            tasks[index].isDone = value ?? false;
          },
          onDelete: () {
            // Handle task deletion
            tasks.removeAt(index);
          },
        );
      },
    );
  }
}
