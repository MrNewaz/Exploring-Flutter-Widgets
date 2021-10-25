import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  const SecondScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen $name'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'Saif');
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
