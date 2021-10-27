import 'package:exploring_widgets/services/api_services.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  final String name;
  const ProductDetail({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.toString()),
      ),
      body: FutureBuilder(
          future: ApiService().getOnePost(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final item = snapshot.data;
              return Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.network(
                        item['image'],
                        height: 200,
                        width: double.infinity,
                      ),
                      Text(
                        'Price: ${item['price']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Chip(
                        label: Text(
                          item['category'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      const SizedBox(height: 15),
                      Text(item['description']),
                    ],
                  ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ApiService().updateCart(1, id);

          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Added')));
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
