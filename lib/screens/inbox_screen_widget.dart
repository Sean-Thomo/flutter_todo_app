import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Inbox', style: GoogleFonts.montserrat()),
      ),
      body: Center(
        child: Text(
          'Inbox Screen',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
