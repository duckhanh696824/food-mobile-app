import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info section
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green.shade700),
            currentAccountPicture: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3386&q=80'),
              ),
            ),
            accountName: Padding(
              padding: const EdgeInsets.only(
                  top: 14.0), // Khoảng cách giữa ảnh và tên
              child: Text(
                "Đức Khánh",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: Padding(
              padding: const EdgeInsets.only(
                  top: 0.5), // Khoảng cách ngắn hơn giữa tên và email
              child: Text(
                "123@gmail.com",
                style:
                    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
          ),

          // Divider
          //const Divider(),

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
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.setting),
            title: const Text("Cài đặt"),
            onTap: () {
              // Handle navigation
            },
          ),

          // Divider
          const Divider(),

          // Logout section
          ListTile(
            leading: const Icon(IconlyLight.logout),
            title: const Text("Đăng xuất"),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
