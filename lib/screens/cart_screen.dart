import 'package:exploring_widgets/models/product.dart';
import 'package:exploring_widgets/services/api_services.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiService().getCart(1),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List products = snapshot.data['products'];
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future:
                          ApiService().getOnePost(products[index]['productId']),
                      builder: (context, AsyncSnapshot asyncsnapshot) {
                        if (asyncsnapshot.hasData) {
                          Product product = asyncsnapshot.data;
                          return Center(
                            child: ListTile(
                              leading: Image.network(
                                product.image,
                                width: 50,
                              ),
                              title: Text(product.title.toString()),
                              subtitle: Text(product.price.toString()),
                              trailing: IconButton(
                                onPressed: () async => {
                                  await ApiService().deleteCart('${index + 1}'),
                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            ),
                          );
                        }
                        return const Center(
                          child: LinearProgressIndicator(),
                        );
                      });
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
