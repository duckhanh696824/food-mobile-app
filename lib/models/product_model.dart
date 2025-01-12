class Product {
  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.origin,
    required this.sold,
    required this.thumbnailUrl,
    required this.images,
    required this.rating,
    required this.numberOfReview,
    required this.hot,
    required this.category,
    required this.hashtags,
    required this.supplier,
    required this.attributes,
  });

  final String? id;
  final String? name;
  final String? slug;
  final String? description;
  final String? origin;
  final int? sold;
  final String? thumbnailUrl;
  final List<Image> images;
  final double? rating;
  final int? numberOfReview;
  final bool? hot;
  final dynamic category;
  final List<dynamic> hashtags;
  final Supplier? supplier;
  final List<Attribute> attributes;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      description: json["description"],
      origin: json["origin"],
      sold: json["sold"],
      thumbnailUrl: json["thumbnail_url"],
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      rating: (json['rating'] is double)
          ? json['rating']
          : (json['rating'] as int).toDouble(),
      numberOfReview: json["numberOfReview"],
      hot: json["hot"],
      category: json["category"],
      hashtags: json["hashtags"] == null
          ? []
          : List<dynamic>.from(json["hashtags"]!.map((x) => x)),
      supplier:
          json["supplier"] == null ? null : Supplier.fromJson(json["supplier"]),
      attributes: json["attributes"] == null
          ? []
          : List<Attribute>.from(
              json["attributes"]!.map((x) => Attribute.fromJson(x))),
    );
  }

  get price => null;

  get unit => null;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "origin": origin,
        "sold": sold,
        "thumbnail_url": thumbnailUrl,
        "images": images.map((x) => x?.toJson()).toList(),
        "rating": rating,
        "numberOfReview": numberOfReview,
        "hot": hot,
        "category": category,
        "hashtags": hashtags.map((x) => x).toList(),
        "supplier": supplier?.toJson(),
        "attributes": attributes.map((x) => x?.toJson()).toList(),
      };
}

class Attribute {
  Attribute({
    required this.id,
    required this.weight,
    required this.originalPrice,
    required this.discountedPercent,
    required this.dimensions,
    required this.unitOfMeasurement,
    required this.quantityPerUnit,
    required this.certification,
    required this.harvestDate,
    required this.link,
    required this.expirationDate,
    required this.productId,
    required this.discountPrice,
    required this.totalPrice,
  });

  final String? id;
  final double? weight;
  final double? originalPrice;
  final double? discountedPercent;
  final String? dimensions;
  final String? unitOfMeasurement;
  final double? quantityPerUnit;
  final String? certification;
  final DateTime? harvestDate;
  final String? link;
  final DateTime? expirationDate;
  final String? productId;
  final double? discountPrice;
  final double? totalPrice;

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json["_id"],
      weight: json["weight"],
      originalPrice: json["original_price"],
      discountedPercent: json["discounted_percent"],
      dimensions: json["dimensions"],
      unitOfMeasurement: json["unit_of_measurement"],
      quantityPerUnit: json["quantity_per_unit"],
      certification: json["certification"],
      harvestDate: DateTime.tryParse(json["harvest_date"] ?? ""),
      link: json["link"],
      expirationDate: DateTime.tryParse(json["expiration_date"] ?? ""),
      productId: json["product_id"],
      discountPrice: json["discount_price"],
      totalPrice: json["total_price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "weight": weight,
        "original_price": originalPrice,
        "discounted_percent": discountedPercent,
        "dimensions": dimensions,
        "unit_of_measurement": unitOfMeasurement,
        "quantity_per_unit": quantityPerUnit,
        "certification": certification,
        "harvest_date":
            "${harvestDate?.year.toString().padLeft(4, '0')}-${harvestDate?.month.toString().padLeft(2, '0')}-${harvestDate?.day.toString().padLeft(2, '0')}",
        "link": link,
        "expiration_date":
            "${expirationDate?.year.toString().padLeft(4, '0')}-${expirationDate?.month.toString().padLeft(2, '0')}-${expirationDate?.day.toString().padLeft(2, '0')}",
        "product_id": productId,
        "discount_price": discountPrice,
        "total_price": totalPrice,
      };
}

class Image {
  Image({
    required this.id,
    required this.url,
    required this.createdAt,
  });

  final String? id;
  final String? url;
  final DateTime? createdAt;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["_id"],
      url: json["url"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Supplier {
  Supplier({
    required this.id,
    required this.companyName,
    required this.phone,
    required this.email,
    required this.contactName,
    required this.address,
  });

  final String? id;
  final String? companyName;
  final String? phone;
  final String? email;
  final String? contactName;
  final String? address;

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json["_id"],
      companyName: json["company_name"],
      phone: json["phone"],
      email: json["email"],
      contactName: json["contact_name"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "company_name": companyName,
        "phone": phone,
        "email": email,
        "contact_name": contactName,
        "address": address,
      };
}
