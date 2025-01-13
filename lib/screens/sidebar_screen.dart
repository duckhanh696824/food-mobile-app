import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';

class SidebarScreen extends StatelessWidget {
  SidebarScreen({super.key});

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sử dụng Obx để lắng nghe sự thay đổi của user
          Obx(() {
            final user = userController.user.value;

            // Kiểm tra user có null hay không
            if (user == null) {
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green.shade700),
                currentAccountPicture: CircleAvatar(
                  radius: 62,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(Icons.person, size: 60),
                ),
                accountName: const Text(
                  "Unknown",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                accountEmail: const Text(
                  "unknown@gmail.com",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              );
            }

            // Nếu user không null, hiển thị thông tin
            return UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green.shade700),
              currentAccountPicture: CircleAvatar(
                radius: 62,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: user.avatar != null && user.avatar!.isNotEmpty
                    ? CircleAvatar(
                        radius: 60,
                        foregroundImage: NetworkImage(user.avatar!),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: Text(
                          user.fullName!.isNotEmpty
                              ? user.fullName![0].toUpperCase()
                              : '?',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
              ),
              accountName: Text(
                user.fullName!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                user.email!,
                style:
                    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            );
          }),

          // Menu items
          ListTile(
            leading: const Icon(IconlyLight.bookmark),
            title: const Text("Sản phẩm đã lưu"),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.timeCircle),
            title: const Text("Lịch sử đặt"),
            onTap: () {
              Get.toNamed('/orders');
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.setting),
            title: const Text("Cài đặt"),
            onTap: () {
              // Handle navigation
            },
          ),

          const Divider(),

          // Logout section
          ListTile(
            leading: const Icon(IconlyLight.logout),
            title: const Text("Đăng xuất"),
            onTap: () {
              userController.user.value = null; // Reset user
              Get.offAllNamed('/login'); // Quay lại trang đăng nhập
            },
          ),
        ],
      ),
    );
  }
}
