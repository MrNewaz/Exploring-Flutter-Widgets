import 'package:exploring_widgets/models/product.dart';
import 'package:exploring_widgets/screens/all_category.dart';
import 'package:exploring_widgets/screens/cart_screen.dart';
import 'package:exploring_widgets/screens/fruit_screen.dart';
import 'package:exploring_widgets/screens/product_detail.dart';
import 'package:exploring_widgets/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllCategory(),
                    ),
                  ),
              icon: const Icon(Icons.view_list)),
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  ),
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FruitScreen(),
              ),
            ),
            icon: const Icon(Icons.food_bank),
          )
        ],
      ),
      body: FutureBuilder(
          future: ApiService().getAllPost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Product product = snapshot.data[index];

                      return ListTile(
                        leading: Image.network(
                          product.image,
                          width: 50,
                        ),
                        title: Text(product.title),
                        // subtitle: Text(dataSet['price']),
                        subtitle: Text('Price: ${product.price} BDT'),
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                id: product.id,
                                name: product.title,
                              ),
                            ),
                          ),
                        },
                      );
                    }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
