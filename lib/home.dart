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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home),
        ),
        title: Image.asset(
          'assets/icon.png',
          height: 50,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text('Newaz'),
            subtitle: const Text('Full Stack Developer'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
            onTap: () => {},
          ),
        ]),
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
