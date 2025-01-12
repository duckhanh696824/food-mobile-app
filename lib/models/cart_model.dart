class Cart {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime lastModified;
  final double totalPrice;
  final List<CartItem> carts;

  Cart({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.lastModified,
    required this.totalPrice,
    required this.carts,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json["_id"],
      userId: json["user_id"],
      createdAt: DateTime.parse(json["created_at"]),
      lastModified: DateTime.parse(json["lastModified"]),
      totalPrice: json["total_price"].toDouble(),
      carts: (json["carts"] as List).map((item) => CartItem.fromJson(item)).toList(),
    );
  }
}

class CartItem {
  final ProductDetails productDetails;
  final String productAttributeId;
  final int quantity;
  final double price;

  CartItem({
    required this.productDetails,
    required this.productAttributeId,
    required this.quantity,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productDetails: ProductDetails.fromJson(json["productDetails"]),
      productAttributeId: json["productAttributeId"],
      quantity: json["quantity"],
      price: json["price"].toDouble(),
    );
  }
}

class ProductDetails {
  final String id;
  final String name;
  final String slug;
  final String description;
  final String thumbnailUrl;

  ProductDetails({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.thumbnailUrl,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      description: json["description"],
      thumbnailUrl: json["thumbnail_url"],
    );
  }
}
