import 'package:theme_and_clean_architecture_state_management/domain/model/product.dart';

class ProductCart {
  ProductCart({
    required this.product,
    this.quantity = 1,
  });
  final Product product;
  int quantity;
}
