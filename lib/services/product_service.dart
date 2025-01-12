import 'dart:convert';
import 'package:agriplant/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse("${ApiConstants.baseUrl}/${ApiConstants.getAllProductsEndpoint}"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List productsJson = data['data'];
      return productsJson.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<Product> fetchProductDetails(String id) async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.getAllProductsEndpoint}/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
