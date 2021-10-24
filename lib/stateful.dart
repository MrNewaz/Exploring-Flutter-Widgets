import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({
    Key? key,
    this.name = 'Saif',
  }) : super(key: key);

  String name;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<String> names = [
    'Saif',
    'Maisha',
    'Tamal',
  ];

  int i = 0;

  Color color = Colors.red;

  String? appName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hmmms ${widget.name}'),
        centerTitle: true,
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          children: [
            Text('My name is ${names[i]}'),
            ElevatedButton(
                onPressed: () {
                  i < 2
                      ? setState(() {
                          i++;
                        })
                      : null;
                },
                child: const Text('Next')),
            ElevatedButton(
                onPressed: () {
                  i != 0
                      ? setState(() {
                          i--;
                        })
                      : null;
                },
                child: const Text('Back')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            color = Colors.blue;
          });
        },
        child: const Icon(Icons.format_paint_sharp),
      ),
    );
  }
}
