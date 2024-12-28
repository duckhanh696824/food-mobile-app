import 'package:agriplant/data/login.dart';
import 'package:agriplant/models/login.dart';
import 'package:agriplant/pages/home_page.dart';
import 'package:agriplant/widgets/background_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: BackgroundAuth(
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "ĐĂNG KÝ",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.green.shade700,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              //Input Email
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 52),
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

              SizedBox(height: size.height * 0.03),

              // Input Password
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 52),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Nhập lại mật khẩu",
                  ),
                  obscureText: true,
                ),
              ),

              SizedBox(height: size.height * 0.04),

              // Buttons: Quay lại và Đăng ký
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 48, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Quay lại trang trước đó
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
                        "Quay lại",
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10), // Khoảng cách giữa hai nút

                    ElevatedButton(
                      onPressed: () {
                        // Nút này không cần logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(59, 105, 57, 1),
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
                        "Đăng ký",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
