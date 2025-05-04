import 'package:flutter/material.dart';
import 'screens/home_screen_widget.dart';
import 'screens/inbox_screen_widget.dart';
import 'screens/search_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: const MyHomePage(title: 'Today'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedWidget = 0;

  final List<Widget> _screens = [HomeWidget(), SearchScreen(), InboxScreen()];

  void _widgetTapped(int index) {
    setState(() {
      _selectedWidget = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedWidget),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: ''),
        ],
        currentIndex: _selectedWidget,
        onTap: _widgetTapped,
      ),
    );
  }
}
