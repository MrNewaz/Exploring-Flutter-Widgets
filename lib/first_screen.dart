import 'package:exploring_widgets/home.dart';
import 'package:exploring_widgets/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Saif'),
              accountEmail: Text('Saif@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.ac_unit),
              ),
            ),
            ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () => {
                      Navigator.pop(context),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(
                            title: 'Newaz',
                          ),
                        ),
                      ),
                    }),
            ListTile(
              title: const Text('Second Screen'),
              leading: const Icon(Icons.send),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(
                    name: 'Hmmm2',
                  ),
                ),
              ),
            ),
          ],
        ),
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
