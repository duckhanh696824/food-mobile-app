import 'package:agriplant/models/product_model.dart';
import 'package:agriplant/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  var filteredProducts = <Product>[].obs; // Danh sách sản phẩm đã lọc
  var searchQuery = "".obs; // Truy vấn tìm kiếm
  var selectedProduct = Rxn<Product>(); // Sản phẩm được chọn
  final ProductService productService;
  ProductController(this.productService);
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  // Lấy danh sách sản phẩm từ API
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductService().fetchProducts();
      productList.value = products;
      filteredProducts.assignAll(
          products); // Gán danh sách sản phẩm ban đầu vào filteredProducts
    } finally {
      isLoading(false);
    }
  }

  // Lọc sản phẩm theo tên
  void filterProducts(String query) {
    searchQuery.value = query;
    filteredProducts.assignAll(
      productList
          .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase()))
          .toList(),
    );
  }

  // Sắp xếp sản phẩm theo giá
  void sortProducts(String? selectedPriceOption) {
    if (selectedPriceOption != null) {
      filteredProducts.sort(
        (a, b) => selectedPriceOption == "asc"
            ? a.price.compareTo(b.price)
            : b.price.compareTo(a.price),
      );
    }
  }

  // Lấy 1 sản phẩm bằng id
  void fetchProductDetails(String id) async {
    try {
      isLoading(true);
      selectedProduct.value = await ProductService().fetchProductDetails(id);
    } finally {
      isLoading(false);
    }
  }
}
