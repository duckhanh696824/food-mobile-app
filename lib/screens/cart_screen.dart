import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../controller/order_controller.dart';

class CartScreen extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final orderController = Get.find<OrderController>();

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

        if (cart == null || cart.carts.isEmpty) {
          return const Center(
              child: Text("Không có sản phẩm nào trong giỏ hàng"));
        }

        return Column(
          children: [
            // Hiển thị danh sách sản phẩm trong giỏ hàng
            Expanded(
              child: ListView.builder(
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
              ),
            ),
            const Divider(),

            // Form nhập địa chỉ và ghi chú
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nhập địa chỉ giao hàng:",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextField(
                    onChanged: (value) {
                      orderController.address.value = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Địa chỉ",
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Ghi chú (tùy chọn):",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextField(
                    onChanged: (value) {
                      orderController.note.value = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Ghi chú",
                    ),
                  ),
                ],
              ),
            ),

            // Nút Đặt hàng ngay
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Kiểm tra xem địa chỉ đã được nhập chưa
                  if (orderController.address.value.isEmpty) {
                    Get.snackbar("Lỗi", "Vui lòng nhập địa chỉ.");
                  } else {
                    // Lấy danh sách product_attribute_ids từ CartController
                    List<String> productAttributeIds = cart.carts
                        .map((item) => item.productAttributeId)
                        .toList();

                    // Đặt hàng
                    orderController.placeOrder(productAttributeIds);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Đặt hàng ngay",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
