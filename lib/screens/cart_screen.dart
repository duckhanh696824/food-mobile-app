import 'package:agriplant/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../data/products.dart';
import 'payment_infor_screen.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartItems = products.take(4).toList();
  final itemQuantities = List<int>.filled(4, 1);
  final selectedItems = <bool>[false, false, false, false];

  double calculateTotal() {
    double total = 0.0;
    for (int i = 0; i < cartItems.length; i++) {
      if (selectedItems[i]) {
        total += cartItems[i].price * itemQuantities[i];
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final total = calculateTotal().toStringAsFixed(2);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(
              cartItems.length,
              (index) {
                final cartItem = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Checkbox(
                        value: selectedItems[index],
                        onChanged: (value) {
                          setState(() {
                            selectedItems[index] = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: CartItem(
                          cartItem: cartItem,
                          quantity: itemQuantities[index],
                          onQuantityChanged: (newQuantity) {
                            setState(() {
                              itemQuantities[index] = newQuantity;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tổng (${selectedItems.where((e) => e).length} món)"),
                Text(
                  "\$$total",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  final selectedProducts = <Product>[];
                  final selectedQuantities = <int>[];

                  for (int i = 0; i < cartItems.length; i++) {
                    if (selectedItems[i]) {
                      selectedProducts.add(cartItems[i]);
                      selectedQuantities.add(itemQuantities[i]);
                    }
                  }

                  if (selectedProducts.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Vui lòng chọn ít nhất 1 sản phẩm."),
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentInforScreen(
                        selectedItems: selectedProducts,
                        itemQuantities: selectedQuantities,
                      ),
                    ),
                  );
                },
                label: const Text("Tiến hành thanh toán"),
                icon: const Icon(IconlyBold.arrowRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
