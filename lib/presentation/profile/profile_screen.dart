import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_and_clean_architecture_state_management/main_bloc.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/home/home_bloc.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/login/login_screen.dart';
import '../../domain/repository/api_repository_interface.dart';
import 'profile_bloc.dart';
import '../theme.dart';

import '../../domain/repository/local_storage_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen._({Key? key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileBLoC(
        apiRespositoryInteface: context.read<ApiRespositoryInteface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      )..loadTheme(),
      builder: (_, __) => const ProfileScreen._(),
    );
  }

  Future<void> logOut(BuildContext context) async {
    final bloc = context.read<ProfileBLoC>();
    // Provider.of<ProfileBLoC>(context);
    await bloc.logOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen.init(context),
        ),
        (route) => false);
  }

  void onThemeUpdated(BuildContext context, bool isDark) {
    final profileBloc = context.read<ProfileBLoC>();
    // Provider.of<ProfileBLoC>(context);
    profileBloc.updateTheme(isDark);
    final mainBloc = context.read<MainBLoC>();
    mainBloc.loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    //
    final homeBloc = Provider.of<HomeBLoC>(context);
    final bloc = Provider.of<ProfileBLoC>(context);
    //
    final user = homeBloc.user;
    //
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).dividerColor,
              ),
        ),
      ),
      body: (user?.image != null || user?.image == '')
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: DeliveryColors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 50,
                            child: Image.asset(
                              user!.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Pedro Tovar',
                        style: TextStyle(color: Theme.of(context).dividerColor),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Personal information',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).dividerColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                'User name:',
                                style: TextStyle(
                                  color: DeliveryColors.green,
                                ),
                              ),
                              Text(
                                user.userName,
                                style: TextStyle(
                                    color: Theme.of(context).dividerColor),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Dark mode',
                                  ),
                                  Switch(
                                    activeColor: Theme.of(context).dividerColor,
                                    value: bloc.isDark,
                                    onChanged: (value) =>
                                        onThemeUpdated(context, value),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: DeliveryColors.purple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            onPressed: () => logOut(context),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38.0),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: DeliveryColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
