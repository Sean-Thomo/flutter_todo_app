import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<String> _tasks = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _openAddItemWidget() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddTaskSheet(onSave: _addTask);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Today', style: GoogleFonts.montserrat()),
      ),
      body: _tasks.isEmpty ? const EmptyState() : TaskList(tasks: _tasks),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: _openAddItemWidget,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddTaskSheet extends StatelessWidget {
  final Function(String) onSave;

  const AddTaskSheet({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        color: const Color.fromARGB(255, 71, 71, 71),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter item',
                hintStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  onSave(controller.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add your first task',
        style: GoogleFonts.montserrat(color: Colors.white),
      ),
    );
  }
}

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
