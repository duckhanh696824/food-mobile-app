import 'package:agriplant/controller/auth_controller.dart';
import 'package:agriplant/data/login.dart';
import 'package:agriplant/screens/home_screen.dart';
import 'package:agriplant/screens/register_screen.dart';
import 'package:agriplant/widgets/background_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthController authController = Get.put(AuthController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: BackgroundAuth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "ĐĂNG NHẬP",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.green.shade700,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.04),

            //Input Email
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 52),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // Input Password
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 52),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                ),
                obscureText: true,
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 52, vertical: 10),
              child: Text(
                "Quên mật khẩu?",
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontSize: 13,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 48, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //Chuyển đến trang Đăng ký
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade50,
                      fixedSize: Size(122, 40),
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0), // Bo góc
                        side: BorderSide(
                            color: Colors.green.shade700, width: 1), // Viền
                      ),
                    ),
                    child: Text(
                      "Tạo tài khoản",
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10), // Khoảng cách giữa hai nút

                  Obx(() {
                    return authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              authController.login(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(59, 105, 57, 1),
                              fixedSize: const Size(109, 40),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0),
                                side: const BorderSide(
                                    color: Colors.white, width: 1), // Viền
                              ),
                            ),
                            child: const Text(
                              "Đăng nhập",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
