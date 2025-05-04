import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemWidget extends StatefulWidget {
  final String task;
  const ItemWidget({super.key, required this.task});

  @override
  ItemWidgetState createState() => ItemWidgetState();
}

class ItemWidgetState extends State<ItemWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.task,
        style: GoogleFonts.inter(
          color: Colors.white,
          decoration: _isSelected ? TextDecoration.lineThrough : null,
          decorationColor: Colors.white,
          decorationThickness: 2,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.red,
      activeColor: Colors.white,
      value: _isSelected,
      onChanged: (bool? value) {
        setState(() {
          _isSelected = value!;
        });
      },
    );
  }
}
