import 'package:agriplant/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(product: product)),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        elevation: 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Container(
              height: 120,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    product.thumbnailUrl ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Product details section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name ?? 'Unknown Product',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  // Price and action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price information
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "${product.attributes.isNotEmpty ? product.attributes[0].totalPrice : 0}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text:
                                  "/${product.attributes.isNotEmpty ? product.attributes[0].unitOfMeasurement : ''}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      // Add to cart button
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton.filled(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          iconSize: 18,
                          icon: const Icon(Icons.shopping_cart),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
