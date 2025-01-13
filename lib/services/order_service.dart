import 'dart:convert';
import 'package:agriplant/constants/api_constants.dart';
import 'package:agriplant/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:agriplant/models/order_model.dart';

class OrderService {
  final AuthController _authController = Get.find();

  Future<List<Order>> fetchOrders() async {
    final String accessToken = _authController.accessToken!;

    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.getAllOrdersEndpoint}'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      return data.map((orderJson) => Order.fromJson(orderJson)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<bool> placeOrder({
    required List<String> productAttributeIds,
    required String paymentMethod,
    required String address,
    required String note,
  }) async {
    final accessToken = _authController.accessToken;

    final url = Uri.parse('${ApiConstants.baseUrl}/${ApiConstants.addOrderEndpoint}'); 

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'product_attribute_ids': productAttributeIds,
        'payment_method': paymentMethod,
        'address': address,
        'note': note,
      }),
    );

    if (response.statusCode == 200) {
      return true; // Đặt hàng thành công
    } else {
      return false; // Thất bại
    }
  }
}
