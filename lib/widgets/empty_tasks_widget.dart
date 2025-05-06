import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
