import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void _openSearchSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SearchTaskSheet();
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
        title: Text('Search', style: GoogleFonts.montserrat()),
      ),
      body: Placeholder(
        color: Colors.black,
        child: Center(
          child: Text(
            'Search for tasks',
            style: GoogleFonts.inter(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: _openSearchSheet,
        tooltip: 'Search Task',
        child: const Icon(Icons.search),
      ),
    );
  }
}

class SearchTaskSheet extends StatelessWidget {
  SearchTaskSheet({super.key});
  final TextEditingController taskSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[900],
        child: TextField(
          autofocus: true,
          controller: taskSearchController,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: 'Search for a task',
            hintStyle: GoogleFonts.inter(
              color: Colors.white,
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
              icon: const Icon(Icons.search, color: Colors.red),
              onPressed: () {
                // Implement search functionality here
                print('Searching for: ${taskSearchController.text}');
              },
            ),
          ),
          onSubmitted: (value) {
            // Implement search functionality here
            print('Searching for: $value');
          },
        ),
      ),
    );
  }
}
