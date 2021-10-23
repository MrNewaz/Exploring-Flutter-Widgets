import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  final String img = 'https://picsum.photos/250?image=9';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        title: Image.asset(
          'assets/icon.png',
          height: 50,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Saif Newaz',
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset('assets/icon.png'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () {},
        child: const Icon(Icons.plus_one),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
