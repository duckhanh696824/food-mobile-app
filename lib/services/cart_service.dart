import 'dart:convert';
import 'package:agriplant/constants/api_constants.dart';
import 'package:agriplant/models/cart_model.dart';
import 'package:agriplant/models/product_model.dart';
import 'package:http/http.dart' as http;

class CartService {


  Future<void> addToCart({
    required String productId,
    required String productAttributeId,
    required int quantity,
    required String accessToken,
  }) async {
    final url =
        Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.addCartEndpoint}');
    final body = jsonEncode({
      'items': [
        {
          'product_id': productId,
          'product_attribute_id': productAttributeId,
          'quantity': quantity,
        }
      ]
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Thêm vào giỏ hàng thành công');
      } else {
        print('Thêm vào giỏ hàng thất bại: ${response.body}');
      }
    } catch (e) {
      print('Lỗi: $e');
    }
  }

  Future<Cart?> fetchCart(String accessToken) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.getCartEndpoint}');
    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)["data"];
        return Cart.fromJson(data);
      } else {
        throw Exception("Failed to load cart data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
