import 'package:flutter/widgets.dart';

import '../../domain/repository/api_repository_interface.dart';
import '../../domain/repository/local_storage_repository.dart';

class ProfileBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRespositoryInteface apiRespositoryInteface;
  ProfileBLoC({
    required this.apiRespositoryInteface,
    required this.localRepositoryInterface,
  });

  bool isDark = false;

  void loadTheme() async {
    isDark = await localRepositoryInterface.isDarkMode();
    notifyListeners();
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRespositoryInteface.logout(token!);
    await localRepositoryInterface.clearAllData();
  }

  void updateTheme(bool value) {
    localRepositoryInterface.saveDarkMode(value);
    isDark = value;
    notifyListeners();
  }
}
