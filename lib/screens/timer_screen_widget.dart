import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Timer', style: GoogleFonts.montserrat()),
      ),
      body: Center(
        child: Text(
          'Timer Screen',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
