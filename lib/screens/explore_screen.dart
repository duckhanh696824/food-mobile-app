import 'package:agriplant/controller/product_controller.dart';
import 'package:agriplant/screens/banner_screen.dart';
import 'package:agriplant/screens/filter_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:agriplant/widgets/product_card.dart';

class ExploreScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController(Get.find()));

  ExploreScreen({super.key});

  void _openFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FilterProductScreen(
        onApplyFilter: (selectedPriceOption) {
          if (selectedPriceOption != null) {
            productController.sortProducts(selectedPriceOption);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: productController.filterProducts,
                    decoration: InputDecoration(
                      hintText: "Tìm sản phẩm...",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      prefixIcon: const Icon(IconlyLight.search),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton.filled(
                    onPressed: () => _openFilterDialog(context),
                    icon: const Icon(IconlyLight.filter),
                  ),
                ),
              ],
            ),
          ),
          // Banner
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: BannerScreen(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sản phẩm nổi bật",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Xem thêm"),
              ),
            ],
          ),
          // Hiển thị danh sách sản phẩm
          Obx(
            () => GridView.builder(
              itemCount: productController.filteredProducts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                    product: productController.filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
