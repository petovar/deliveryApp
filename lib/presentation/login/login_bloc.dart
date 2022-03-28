import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/domain/exception/auth_exception.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/api_repository_interface.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/local_storage_repository.dart';
import 'package:theme_and_clean_architecture_state_management/domain/request/login_request.dart';

enum LoginState {
  loading,
  initial,
}

class LoginBLoC extends ChangeNotifier {
  //
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRespositoryInteface apiRespositoryInteface;

  LoginBLoC({
    required this.localRepositoryInterface,
    required this.apiRespositoryInteface,
  });

  final usermameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial;
  //
  Future<bool> login() async {
    final userName = usermameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse = await apiRespositoryInteface.login(
        LoginRequest(
          userName: userName,
          password: password,
        ),
      );
      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      loginState = LoginState.initial;
      notifyListeners();
      return true;
    } on AuthException catch (_) {
      loginState = LoginState.initial;
      notifyListeners();
      return false;
    }
  }
}
