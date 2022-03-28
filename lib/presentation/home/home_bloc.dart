import 'package:flutter/cupertino.dart';
import 'package:theme_and_clean_architecture_state_management/domain/model/user.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/api_repository_interface.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/local_storage_repository.dart';

class HomeBLoC extends ChangeNotifier {
  final ApiRespositoryInteface apiRespositoryInteface;
  final LocalRepositoryInterface localRepositoryInterface;

  HomeBLoC({
    required this.apiRespositoryInteface,
    required this.localRepositoryInterface,
  });

  User? user;
  int? indexSelected = 0;

  void loadUser() async {
    user = await localRepositoryInterface.getUser();
    notifyListeners();
  }

  void updateIndexSelected(int index) {
    indexSelected = index;
    notifyListeners();
  }
}
