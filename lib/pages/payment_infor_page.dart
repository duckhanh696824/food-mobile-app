import 'package:agriplant/pages/order_success_page.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class PaymentInforPage extends StatefulWidget {
  final List<Product> selectedItems;
  final List<int> itemQuantities;

  const PaymentInforPage({
    super.key,
    required this.selectedItems,
    required this.itemQuantities,
  });

  @override
  State<PaymentInforPage> createState() => _PaymentInforPageState();
}

class _PaymentInforPageState extends State<PaymentInforPage> {
  String shippingMethod = "Standard"; // Default shipping method

  @override
  Widget build(BuildContext context) {
    final shippingFee = shippingMethod == "Standard" ? 10.0 : 30.0;
    final totalProductCost = widget.selectedItems
        .asMap()
        .entries
        .map((entry) => entry.value.price * widget.itemQuantities[entry.key])
        .reduce((value, element) => value + element);

    final grandTotal = totalProductCost + shippingFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin thanh toán"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Information Section
            Row(
              children: const [
                Icon(Icons.local_shipping, size: 24, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "Thông tin vận chuyển",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set color to black for the label
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Tên người nhận",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Đức Khánh", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Địa chỉ",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("123 Man Thiện", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Số điện thoại",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("0123456789", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),

            // Product List
            ...List.generate(
              widget.selectedItems.length,
              (index) {
                final product = widget.selectedItems[index];
                final quantity = widget.itemQuantities[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(product.name),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.attach_money,
                            size: 18, color: Colors.grey),
                        Text("Price: \$${product.price} x $quantity"),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart, color: Colors.green),
                        Text(
                          "\$${(product.price * quantity).toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // Shipping Method
            Row(
              children: const [
                Icon(Icons.local_shipping, size: 24, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "Phương thức vận chuyển",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            RadioListTile<String>(
              title: const Text("Thường (10\$)"),
              value: "Standard",
              groupValue: shippingMethod,
              onChanged: (value) {
                setState(() {
                  shippingMethod = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Hỏa tốc (30\$)"),
              value: "Express",
              groupValue: shippingMethod,
              onChanged: (value) {
                setState(() {
                  shippingMethod = value!;
                });
              },
            ),
            const SizedBox(height: 10),

            // Separator Line (for summary section highlight)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 1,
              color: Colors.grey[300],
            ),

            // Fee Summary (Highlighted)
            Row(
              children: const [
                Icon(Icons.receipt_long, size: 24, color: Colors.deepOrange),
                SizedBox(width: 8),
                Text(
                  "Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Phí vận chuyển",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${shippingFee.toStringAsFixed(2)}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tiền hàng",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${totalProductCost.toStringAsFixed(2)}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: const Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    "Tổng tiền: \$${grandTotal.toStringAsFixed(2)}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle payment
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => OrderSuccessPage(),
                  );
                },
                icon: const Icon(Icons.payment),
                label: const Text("Thanh toán"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
