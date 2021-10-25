import 'package:exploring_widgets/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String status = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondScreen(
                  name: 'Hmmm2',
                ),
              ),
            );
            print(status);
          },
          child: const Text('Go To Second Page'),
        ),
      ),
    );
  }
}
