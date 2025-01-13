import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<User>(); // Biến để lưu thông tin người dùng

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await UserService.login(email, password);
      final userData = User.fromJson(response['data']);
      user.value = userData;

      // Chuyển tới Home sau khi đăng nhập thành công
      Get.offAllNamed('/main');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String? get accessToken =>
      user.value?.accessToken; //Truy xuất access_token từ nơi khác
}
