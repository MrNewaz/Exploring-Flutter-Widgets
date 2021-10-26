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
              return Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data['image'],
                        height: 200,
                        width: double.infinity,
                      ),
                      Text('Title: ${snapshot.data['title']}')
                    ],
                  ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
