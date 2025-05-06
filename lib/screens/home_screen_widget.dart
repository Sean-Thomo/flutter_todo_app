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
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
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
              autofocus: true,
              controller: controller,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Add a new task...',
                hintStyle: GoogleFonts.inter(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send_rounded, color: Colors.red),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      onSave(controller.text);
                      controller.clear();
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  onSave(value);
                  controller.clear();
                  Navigator.pop(context);
                }
              },
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
        'Add your first task.',
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
