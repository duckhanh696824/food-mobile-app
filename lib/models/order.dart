import 'package:agriplant/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime date;
  Order({
    required this.id,
    required this.products,
    required this.date,
  });

  get paymentMethod => null;

  get status => null;

  get orderDate => null;

  get address => null;
}
