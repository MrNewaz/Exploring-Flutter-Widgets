import 'package:exploring_widgets/screens/home.dart';
import 'package:exploring_widgets/services/api_services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController username =
      TextEditingController(text: 'mor_2314');
  final TextEditingController password = TextEditingController(text: '83r5^_');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                decoration: const InputDecoration(
                  labelText: 'Enter Username',
                  hintText: 'username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: 'Enter Password',
                  hintText: '123456',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final token =
                        await ApiService().login(username.text, password.text);

                    if (token['token'] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Success',
                        ),
                        backgroundColor: Colors.green,
                      ));
                      Future.delayed(
                          const Duration(seconds: 2),
                          () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              ));
                      Future.delayed(const Duration(seconds: 2), () => {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Failed'),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ));
  }
}
