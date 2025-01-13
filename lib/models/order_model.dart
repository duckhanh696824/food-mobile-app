class Order {
  Order({
    required this.id,
    required this.userId,
    required this.paymentMethod,
    required this.appliedCoupon,
    required this.status,
    required this.address,
    required this.subtotal,
    required this.discountTotal,
    required this.tax,
    required this.total,
    required this.note,
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? userId;
  final String? paymentMethod;
  final dynamic appliedCoupon;
  final String? status;
  final String? address;
  final int? subtotal;
  final int? discountTotal;
  final int? tax;
  final int? total;
  final String? note;
  final DateTime? orderDate;
  final DateTime? createdAt;
  final dynamic updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["_id"],
      userId: json["user_id"],
      paymentMethod: json["payment_method"],
      appliedCoupon: json["applied_coupon"],
      status: json["status"],
      address: json["address"],
      subtotal: json["subtotal"],
      discountTotal: json["discount_total"],
      tax: json["tax"],
      total: json["total"],
      note: json["note"],
      orderDate: DateTime.tryParse(json["order_date"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "payment_method": paymentMethod,
        "applied_coupon": appliedCoupon,
        "status": status,
        "address": address,
        "subtotal": subtotal,
        "discount_total": discountTotal,
        "tax": tax,
        "total": total,
        "note": note,
        "order_date": orderDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
      };
}
