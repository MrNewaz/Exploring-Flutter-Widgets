import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future getAllPost() async {
    final allProductUrl = Uri.parse('https://fakestoreapi.com/products');

    final result = await http.get(allProductUrl);

    print(result.statusCode);
    print(result.body);

    return json.decode(result.body);
  }

  Future getOnePost(int id) async {
    final singleUrl = Uri.parse('https://fakestoreapi.com/products/$id');

    final result = await http.get(singleUrl);

    print(result.statusCode);
    print(result.body);

    return json.decode(result.body);
  }

  Future getAllCategory() async {
    final categoryUrl =
        Uri.parse('https://fakestoreapi.com/products/categories');

    final result = await http.get(categoryUrl);

    print(result.statusCode);
    print(result.body);

    return json.decode(result.body);
  }
}
