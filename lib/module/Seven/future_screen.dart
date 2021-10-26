import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  _FutureScreenState createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  Future<String> getUserName() async {
    final String user = await Future.delayed(const Duration(seconds: 2), () {
      return 'Saif';
    });
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FutureScreen'),
        ),
        body: FutureBuilder(
            future: getUserName(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Text(snapshot.data),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
