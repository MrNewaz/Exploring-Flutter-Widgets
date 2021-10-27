import 'package:exploring_widgets/screens/product_detail.dart';
import 'package:exploring_widgets/services/api_services.dart';
import 'package:flutter/material.dart';

class CategoryProduct extends StatelessWidget {
  final String categoryName;
  const CategoryProduct({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiService().getProductByCategory(categoryName),
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
