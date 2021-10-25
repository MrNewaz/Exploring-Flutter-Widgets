import 'package:exploring_widgets/tabbar/first_screen.dart';
import 'package:exploring_widgets/tabbar/second_screen.dart';
import 'package:exploring_widgets/tabbar/third_screen.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Handling Text Input'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.shopping_basket)),
              Tab(icon: Icon(Icons.contact_page)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ),
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       TextField(
        //         decoration: InputDecoration(
        //           labelText: 'Enter Name',
        //           helperText: 'Name',
        //           border: OutlineInputBorder(),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
