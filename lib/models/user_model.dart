class User {
  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.avatar,
    required this.accessToken,
    required this.refreshToken,
  });

  final String? id;
  final String? email;
  final String? fullName;
  final String? avatar;
  final String? accessToken;
  final String? refreshToken;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      email: json["email"],
      fullName: json["full_name"],
      avatar: json["avatar"],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "full_name": fullName,
        "avatar": avatar,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
