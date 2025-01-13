import 'package:agriplant/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:agriplant/services/order_service.dart';
import 'package:agriplant/models/order_model.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  var address = ''.obs;
  var note = ''.obs;
  var isLoading = true.obs;
  var hasError = false.obs;

  final OrderService _orderService = OrderService();

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);
      final fetchedOrders = await _orderService.fetchOrders();
      orders.assignAll(fetchedOrders);
    } catch (e) {
      hasError(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> placeOrder(List<String> productAttributeIds) async {
    isLoading.value = true;

    final success = await _orderService.placeOrder(
      productAttributeIds: productAttributeIds,
      paymentMethod: 'COD', // Phương thức thanh toán mặc định
      address: address.value,
      note: note.value,
    );

    isLoading.value = false;

    if (success) {
      await CartController().loadCart();
      await fetchOrders();
      Get.snackbar("Thành công", "Đơn hàng đã được đặt thành công!");
      Get.toNamed('/orders');
    } else {
      Get.snackbar("Lỗi", "Đặt hàng không thành công, vui lòng thử lại.");
    }
  }
}
