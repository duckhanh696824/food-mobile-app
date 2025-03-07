import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriplant/models/product_model.dart'; // Đảm bảo đã import đúng model của bạn

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
    required this.quantity,
    required this.onQuantityChanged,
  });

  final Product cartItem; // Chắc chắn rằng cartItem phải là đối tượng Product
  final int quantity;
  final void Function(int newQuantity) onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: const Icon(
          IconlyLight.delete,
          color: Colors.white,
          size: 25,
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        final completer = Completer<bool>();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: "Keep",
              onPressed: () {
                completer.complete(false);
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
            ),
            content: const Text(
              "Remove from cart?",
            ),
          ),
        );
        Timer(const Duration(seconds: 3), () {
          if (!completer.isCompleted) {
            completer.complete(true);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          }
        });

        return await completer.future;
      },
      child: SizedBox(
        height: 125,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          elevation: 0.1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 90,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(cartItem.thumbnailUrl ?? ''), // Cập nhật ảnh từ API
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.name ?? 'Sản phẩm không tên',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 2),
                      Text(
                        cartItem.description ?? 'Không có mô tả',
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${cartItem.price}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ToggleButtons(
                              borderRadius: BorderRadius.circular(99),
                              constraints: const BoxConstraints(
                                minHeight: 30,
                                minWidth: 30,
                              ),
                              isSelected: [false, true, false],
                              children: [
                                const Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                Text(quantity.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ],
                              onPressed: (int index) {
                                if (index == 0 && quantity > 1) {
                                  onQuantityChanged(quantity - 1);
                                } else if (index == 2) {
                                  onQuantityChanged(quantity + 1);
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
