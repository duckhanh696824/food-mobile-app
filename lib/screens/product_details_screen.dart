import 'package:agriplant/data/products.dart';
import 'package:agriplant/screens/drawer_addtocart_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late TapGestureRecognizer readMoreGestureRecognizer;
  bool showMore = false;
  int quantity = 2;

  @override
  void initState() {
    super.initState();
    readMoreGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMore = !showMore;
        });
      };
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add bookmark functionality
            },
            icon: const Icon(IconlyLight.bookmark),
          ),
          IconButton(
            onPressed: () {
              // TODO: Navigate to cart
            },
            icon: const Icon(IconlyLight.bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.thumbnailUrl ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
            // Product Name
            Text(
              widget.product.name ?? '',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            // Price and Stock
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Available in stock",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "${widget.product.attributes.isNotEmpty ? widget.product.attributes[0].totalPrice : 0}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.green),
                      ),
                      TextSpan(
                        text:
                            "/${widget.product.attributes.isNotEmpty ? widget.product.attributes[0].unitOfMeasurement : ''}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            // Quantity Selector
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 18,
                  color: Colors.yellow.shade700,
                ),
                Text(
                  "${widget.product.rating ?? 0} (${widget.product.numberOfReview ?? 0} reviews)",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  "$quantity",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Description
            Text(
              "Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20),
            // Similar Products
            // Text(
            //   "Similar Products",
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleMedium!
            //       .copyWith(fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(products[index].thumbnailUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
                separatorBuilder: (__, _) => const SizedBox(width: 10),
                itemCount: products.length,
              ),
            ),
            const SizedBox(height: 20),
            // Add to Cart Button
            FilledButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        DrawerAddToCartScreen(product: widget.product),
                  );
                },
                icon: const Icon(IconlyLight.bag2),
                label: const Text("Thêm giỏ hàng"))
          ],
        ),
      ),
    );
  }
}
