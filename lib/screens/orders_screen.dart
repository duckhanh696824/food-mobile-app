import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/order_controller.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ["Đơn hàng mới", "Đơn hàng đã hoàn thành"];
    final OrderController orderController = Get.put(OrderController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Danh sách đơn hàng"),
          centerTitle: true,
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: Obx(() {
          if (orderController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return TabBarView(
            children: List.generate(
              tabs.length,
              (index) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orderController.orders.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: OrderItem(order: orderController.orders[index]),
                    );
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
