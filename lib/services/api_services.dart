import 'dart:convert';
import 'package:exploring_widgets/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> getAllPost() async {
    final allProductUrl = Uri.parse('https://fakestoreapi.com/products');

    final result = await http.get(allProductUrl);

    List<Product> allProducts = [];
    List body = json.decode(result.body);

    body.forEach((product) {
      allProducts.add(Product.fromJSON(product));
    });

    // print(result.statusCode);
    // print(result.body);

    return allProducts;
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

  Future getProductByCategory(String category) async {
    final productUrl =
        Uri.parse('https://fakestoreapi.com/products/category/$category');

    final result = await http.get(productUrl);

    print(result.statusCode);
    print(result.body);

    return json.decode(result.body);
  }

  Future getCart(int id) async {
    final cartUrl = Uri.parse('https://fakestoreapi.com/carts/$id');

    final result = await http.get(cartUrl);

    print(result.statusCode);
    print(result.body);

    return json.decode(result.body);
  }

  // Post Request
  Future login(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');

    try {
      final result = await http.post(loginUrl, body: {
        "username": username,
        "password": password,
      });

      print(result.statusCode);
      print(result.body);

      return json.decode(result.body);
    } catch (e) {
      return {'message': e};
    }
  }

  // Post Request with UserAccountsDrawerHeader
  Future loginWithHeaders(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final token = 'random token';
    try {
      final result = await http.post(
        loginUrl,
        body: {
          "username": username,
          "password": password,
        },
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token'
        },
      );

      print(result.statusCode);
      print(result.body);

      return json.decode(result.body);
    } catch (e) {
      return {'message': e};
    }
  }

  // put Request
  Future updateCart(int id, int productId) async {
    final cartUrl = Uri.parse('https://fakestoreapi.com/carts/$id');

    try {
      final result = await http.put(cartUrl, body: {
        'userId': '3',
        'date': DateTime.now().toString(),
        'products': [
          {'productId': '$productId', 'quantity': 3}
        ].toString()
      });

      print(result.statusCode);
      print(result.body);

      return json.decode(result.body);
    } catch (e) {
      print(e);
      return {'message': e};
    }
  }

  // delete Request
  Future deleteCart(String id) async {
    final cartUrl = Uri.parse('https://fakestoreapi.com/carts/$id');

    try {
      final result = await http.delete(cartUrl);
      print(result.body);
    } catch (e) {
      print(e);
      return {'message': e};
    }
  }
}
