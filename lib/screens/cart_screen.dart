import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final cartController = Get.put(CartController());

  CartScreen() {
    cartController.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
      ),
      body: Obx(() {
        if (cartController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final cart = cartController.cart.value;

        if (cart == null) {
          return const Center(
              child: Text("Không có sản phẩm nào trong giỏ hàng"));
        }

        return ListView.builder(
          itemCount: cart.carts.length,
          itemBuilder: (context, index) {
            final item = cart.carts[index];
            return ListTile(
              leading: Image.network(
                item.productDetails.thumbnailUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item.productDetails.name),
              subtitle: Text("${item.quantity} x ${item.price}"),
              trailing: Text(
                  "Tổng: ${(item.quantity * item.price).toStringAsFixed(0)} đ"),
            );
          },
        );
      }),
    );
  }
}
