import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/local_storage_repository.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

class MainBLoC extends ChangeNotifier {
  //
  ThemeData currentTheme = lightTheme;
  final LocalRepositoryInterface localRepositoryInterface;
  //
  MainBLoC({
    required this.localRepositoryInterface,
  });

  void loadTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    updateTheme(isDark ? darkTheme : lightTheme);
  }

  void updateTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
