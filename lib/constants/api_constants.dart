class ApiConstants {
  static const String baseUrl = "http://localhost:8080/api/v1";

  static const String loginEndpoint = "users/login";
  static const String registerEndpoint = "users/register";
  static const String userProfileEndpoint = "users/@me/profile";

  static const String getAllProductsEndpoint = "products";

  static const String getCartEndpoint = "carts";
  static const String addCartEndpoint = "carts/items";

  static const String getAllOrdersEndpoint = "orders";
  static const String addOrderEndpoint = "orders";
}
