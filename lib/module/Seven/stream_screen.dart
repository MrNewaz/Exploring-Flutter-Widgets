import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({Key? key}) : super(key: key);

  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  Stream getUserName() async* {
    for (var i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StreamScreen'),
        ),
        body: StreamBuilder(
            stream: getUserName(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Text(snapshot.data.toString()),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
