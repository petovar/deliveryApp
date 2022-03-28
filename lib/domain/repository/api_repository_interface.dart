import 'package:theme_and_clean_architecture_state_management/domain/model/product.dart';
import 'package:theme_and_clean_architecture_state_management/domain/request/login_request.dart';
import 'package:theme_and_clean_architecture_state_management/domain/response/login_response.dart';

import '../model/user.dart';

abstract class ApiRespositoryInteface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
}
