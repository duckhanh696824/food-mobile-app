import 'package:agriplant/models/cart_model.dart';
import 'package:agriplant/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/cart_service.dart';
import 'auth_controller.dart';

class CartController extends GetxController {
  final CartService _cartService = CartService();
  var cart = Rxn<Cart>();
  var isLoading = false.obs;

  Future<void> addProductToCart({
    required String productId,
    required String productAttributeId,
    required int quantity,
  }) async {
    // Lấy access token từ AuthController
    final AuthController authController = Get.find<AuthController>();
    final String accessToken = authController.accessToken!;

    await _cartService.addToCart(
      productId: productId,
      productAttributeId: productAttributeId,
      quantity: quantity,
      accessToken: accessToken,
    );

    Get.snackbar(
      'Thành công',
      'Sản phẩm đã được thêm vào giỏ hàng',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    await loadCart();
  }

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart() async {
    isLoading.value = true;
    try {
      // Lấy access token từ AuthController
      final AuthController authController = Get.find<AuthController>();
      final String accessToken = authController.accessToken!;
      final data = await _cartService.fetchCart(accessToken);
      cart.value = data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
