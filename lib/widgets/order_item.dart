import 'package:flutter/material.dart';
import '../models/order_model.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header thông tin đơn hàng
            Text(
              "Mã đơn hàng: #${order.id}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Thông tin thanh toán và trạng thái
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Phương thức: ${order.paymentMethod}",
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
                Flexible(
                  child: Text(
                    "Trạng thái: ${order.status}",
                    style: TextStyle(
                        color: order.status == "Pending"
                            ? Colors.orange
                            : Colors.green),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Thông tin tổng tiền
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tổng: ${order.total} VND",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Ngày: ${order.orderDate}",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Địa chỉ giao hàng
            Text(
              "Địa chỉ: ${order.address}",
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis, // Handle overflow
            ),
          ],
        ),
      ),
    );
  }
}
