import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/api_repository_interface.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/local_storage_repository.dart';

class SplashBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRespositoryInteface apiRespositoryInteface;

  SplashBLoC({
    required this.localRepositoryInterface,
    required this.apiRespositoryInteface,
  });

  // validateSession();

  // void validateTheme() async {
  //   final isDark = await localRepositoryInterface.isDarkMode();

  //   if (isDark != null) {
  //     //
  //   } else {
  //     //
  //   }
  // }

  //
  Future<bool> validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRespositoryInteface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      // Va al home
      return true;
    } else {
      // va al ligin
      return false;
    }
  }
}
