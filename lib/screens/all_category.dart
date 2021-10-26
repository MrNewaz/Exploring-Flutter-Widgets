import 'package:exploring_widgets/services/api_services.dart';
import 'package:flutter/material.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiService().getAllCategory(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data[index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 8),
                            child: Center(
                              child: Text(
                                data.toString().toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
