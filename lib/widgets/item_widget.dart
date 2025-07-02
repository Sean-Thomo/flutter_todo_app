import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemWidget extends StatefulWidget {
  final String task;
  final bool isDone;
  // final String? description;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onDelete;

  const ItemWidget({
    super.key,
    required this.task,
    this.isDone = false,
    this.onChanged,
    // this.description,
    this.onDelete,
  });

  @override
  ItemWidgetState createState() => ItemWidgetState();
}

class ItemWidgetState extends State<ItemWidget> {
  late bool isDone = false;

  @override
  void initState() {
    super.initState();
    isDone = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.task,
        style: GoogleFonts.inter(
          color: Colors.white,
          decoration: isDone ? TextDecoration.lineThrough : null,
          decorationColor: Colors.white,
          decorationThickness: 2,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.red,
      activeColor: Colors.white,
      value: isDone,
      onChanged:
          (_) => setState(() {
            isDone = !isDone;
          }),
      secondary: IconButton(
        color: Colors.red,
        icon: const Icon(Icons.delete),
        onPressed: widget.onDelete,
      ),
    );
  }
}
