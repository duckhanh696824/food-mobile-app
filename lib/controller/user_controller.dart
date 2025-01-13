import 'package:agriplant/controller/auth_controller.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;

      // Lấy access token từ AuthController
      final token = Get.find<AuthController>().accessToken;
      final response = await UserService.fetchUserProfile(token!);

      // Chuyển đổi dữ liệu JSON thành UserModel
      user.value = User.fromJson(response['data']);
    } catch (e) {
      print('Error fetching user profile: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
