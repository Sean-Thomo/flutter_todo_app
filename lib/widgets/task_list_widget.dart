import 'package:flutter/material.dart';
import 'item_widget.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ItemWidget(key: ValueKey(index), task: tasks[index]);
      },
    );
  }
}
