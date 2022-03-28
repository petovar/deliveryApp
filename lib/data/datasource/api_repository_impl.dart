import 'package:theme_and_clean_architecture_state_management/data/products/in_memory_products.dart';
import 'package:theme_and_clean_architecture_state_management/domain/exception/auth_exception.dart';
import 'package:theme_and_clean_architecture_state_management/domain/model/product.dart';
import 'package:theme_and_clean_architecture_state_management/domain/response/login_response.dart';
import 'package:theme_and_clean_architecture_state_management/domain/request/login_request.dart';
import 'package:theme_and_clean_architecture_state_management/domain/model/user.dart';
import '../../domain/repository/api_repository_interface.dart';

class ApiRepositoryImpl extends ApiRespositoryInteface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 2));
    if (token == 'AA1111') {
      return User(
        name: 'Pedro Tovar',
        userName: 'petovar',
        image: 'assets/profile/profile.png',
      );
    }
    if (token == 'AA2222') {
      return User(
        name: 'Elonk Musk',
        userName: 'elonk',
        image: 'assets/profile/elonk.png',
      );
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 2));
    if (login.userName == 'petovar' && login.password == '123') {
      final user = User(
        name: 'Pedro Tovar',
        userName: 'petovar',
        image: 'assets/profile/profile.png',
      );
      return LoginResponse(token: 'AA1111', user: user);
    } else if (login.userName == 'elonk' && login.password == '123') {
      final user = User(
        name: 'Elonk Musk',
        userName: 'elonk',
        image: 'assets/profile/elonk.png',
      );
      return LoginResponse(token: 'AA2222', user: user);
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('Removing token from server');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return products;
  }
}
