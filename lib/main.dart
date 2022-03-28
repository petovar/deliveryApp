import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_and_clean_architecture_state_management/data/datasource/api_repository_impl.dart';
import 'package:theme_and_clean_architecture_state_management/data/datasource/local_repository_impl.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/api_repository_interface.dart';
import 'package:theme_and_clean_architecture_state_management/domain/repository/local_storage_repository.dart';
import 'package:theme_and_clean_architecture_state_management/main_bloc.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/splah/splash_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

import 'presentation/cart/cart_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiProvider(
        providers: [
          Provider<ApiRespositoryInteface>(
            create: (_) => ApiRepositoryImpl(),
          ),
          Provider<LocalRepositoryInterface>(
            create: (_) => LocalRepositoryImpl(),
          ),
          ChangeNotifierProvider(
            create: (context) {
              return MainBLoC(
                localRepositoryInterface:
                    context.read<LocalRepositoryInterface>(),
              )..loadTheme();
            },
          ),
          ChangeNotifierProvider(
            create: (_) => CartBLoC(),
          ),
        ],
        child: Builder(builder: (newContext) {
          return Consumer<MainBLoC>(builder: (context, bloc, _) {
            return bloc.currentTheme == null
                ? const SizedBox.shrink()
                : MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: bloc.currentTheme, //lightTheme
                    home: SplashScreen.init(newContext),
                  );
          });
        }),
      );
    });
  }
}
