import 'package:exploring_widgets/models/fruit.dart';
import 'package:exploring_widgets/services/api_services.dart';
import 'package:flutter/material.dart';

class FruitScreen extends StatelessWidget {
  const FruitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Fruits'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getFruits(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Fruit fruit = snapshot.data[index];
                return Card(
                  child: ListTile(
                    title: Center(
                      child: Text(fruit.name),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Carbohydrates ${fruit.nutritions.carbohydrates}'),
                        Text('Protein ${fruit.nutritions.protein}'),
                        Text('Fat ${fruit.nutritions.fat}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
