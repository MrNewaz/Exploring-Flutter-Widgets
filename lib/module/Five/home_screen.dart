import 'package:exploring_widgets/module/Five/first_screen.dart';
import 'package:exploring_widgets/module/Five/second_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  List pages = [
    FirstScreen(),
    SecondScreen(name: 'Hmmm'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saif'),
      ),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.twelve_mp), label: '2nd'),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
          ;
        },
      ),
    );
  }
}
