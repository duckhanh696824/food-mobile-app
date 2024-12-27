class Login {
  final String email;
  final String password;

  Login({required this.email, required this.password});

  // Tạo từ Map (JSON)
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      email: json['email'],
      password: json['password'],
    );
  }

  // Chuyển thành Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
