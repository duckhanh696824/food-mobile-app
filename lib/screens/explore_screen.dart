import 'package:agriplant/models/product.dart';
import 'package:agriplant/screens/banner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriplant/data/products.dart';
import 'package:agriplant/widgets/product_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String searchQuery = "";
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Ban đầu hiển thị tất cả sản phẩm
  }

  void _filterProducts(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
                    onChanged: _filterProducts,
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
                    onPressed: () {
                      // Chức năng filter nâng cao (có thể thêm sau)
                    },
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
                onPressed: () {
                  // Xử lý khi nhấn "See all"
                },
                child: const Text("See all"),
              ),
            ],
          ),
          // Hiển thị danh sách sản phẩm
          GridView.builder(
            itemCount: filteredProducts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: filteredProducts[index]);
            },
          ),
        ],
      ),
    );
  }
}
