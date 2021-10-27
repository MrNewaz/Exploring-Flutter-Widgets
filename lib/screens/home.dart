import 'package:exploring_widgets/screens/all_category.dart';
import 'package:exploring_widgets/screens/cart_screen.dart';
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
              icon: const Icon(Icons.shopping_cart))
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
                      final dataSet = snapshot.data[index];
                      return ListTile(
                        leading: Image.network(
                          dataSet['image'],
                          width: 50,
                        ),
                        title: Text(dataSet['title']),
                        // subtitle: Text(dataSet['price']),
                        subtitle: Text('Price: ${dataSet['price']} BDT'),
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                id: dataSet['id'],
                                name: dataSet['title'],
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