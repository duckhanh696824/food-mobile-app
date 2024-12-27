import 'package:agriplant/data/login.dart';
import 'package:agriplant/models/login.dart';
import 'package:agriplant/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();    

    return Scaffold(
      body: SafeArea(
        // minimum: const EdgeInsets.all(20),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: -40,
                right: -199,
                child: Image.asset('assets/login/top1.png', width: size.width * 0.65),
              ),
              Positioned(
                top: 98,
                left: 75,
                child: Image.asset('assets/login/lá.png', width: size.width * 0.18),
              ),              
              Positioned(
                bottom: -30,
                left: 70,
                child: Image.asset('assets/login/bot2.png', width: size.width * 0.32),
              ),
              Positioned(
                bottom: -23,
                left: -130,
                child: Image.asset('assets/login/bot1.png', width: size.width * 0.65),
              ),
              Positioned(
                bottom: -25,
                right: 26,
                child: Image.asset('assets/login/bot3.png', width: size.width * 0.35),
              ),

              //Form Đăng nhập
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text("ĐĂNG NHẬP",
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
                      child: Text("Quên mật khẩu?",
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontSize: 13,
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.04), 

                    //Button Đăng nhập
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(horizontal: 47, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          final String email = emailController.text.trim();
                          final String password = passwordController.text.trim();

                          // Kiểm tra nếu thông tin bị bỏ trống
                          if (email.isEmpty || password.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Thông báo"),
                                content: const Text("Vui lòng nhập email và mật khẩu."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }

                          // Xác thực thông tin đăng nhập
                          var user;
                          try {
                            user = loginData.firstWhere((user) => user.email == email && user.password == password);
                          } catch (e) {
                            user = null;
                          }

                          if (user != null) {
                            // Nếu thông tin hợp lệ, chuyển đến HomePage
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          } else {
                            // Hiển thị thông báo lỗi
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Đăng nhập thất bại"),
                                content: const Text("Email hoặc mật khẩu không đúng. Vui lòng thử lại."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(59, 105, 57, 1),
                          fixedSize: const Size(111, 40),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                        ),
                        child: const Text(
                          "Đăng nhập",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )


            
            ],
          ),

        ),

      ),
    );
  }
}