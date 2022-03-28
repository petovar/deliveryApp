import 'package:flutter/cupertino.dart';
import 'package:theme_and_clean_architecture_state_management/domain/model/product.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/api_repository_interface.dart';

class ProductsBLoC extends ChangeNotifier {
  //
  final ApiRespositoryInteface apiRespositoryInteface;

  ProductsBLoC({
    required this.apiRespositoryInteface,
  });

  List<Product> productList = <Product>[];

  void loadProduts() async {
    final result = await apiRespositoryInteface.getProducts();
    productList = result;
    notifyListeners();
  }
  //
}
