import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/cart/cart_bloc.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/cart/cart_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/home/home_bloc.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/home/products/products_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/profile/profile_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

import '../../domain/repository/api_repository_interface.dart';
import '../../domain/repository/local_storage_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen._({Key? key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeBLoC(
        apiRespositoryInteface: context.read<ApiRespositoryInteface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      )..loadUser(),
      builder: (_, __) => const HomeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: bloc.indexSelected, // currentIndex,
              children: [
                ProductsScreen.init(context),
                const Placeholder(),
                CartScreen(
                  onShopping: () {
                    bloc.updateIndexSelected(0);
                  },
                ),
                const Placeholder(),
                ProfileScreen.init(context),
              ],
            ),
          ),
          _DeliveryNavigatorBar(
              index: bloc.indexSelected!,
              onIndexSelected: (index) {
                bloc.updateIndexSelected(index);
              }),
        ],
      ),
    );
  }
}

class _DeliveryNavigatorBar extends StatelessWidget {
  const _DeliveryNavigatorBar({
    Key? key,
    required this.index,
    required this.onIndexSelected,
  }) : super(key: key);

  final int index;
  final ValueChanged<int> onIndexSelected;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    final cartBloc = context.watch<CartBLoC>();
    final user = bloc.user;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).primaryColorLight,
              width: 3,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () => onIndexSelected(0),
                icon: Icon(
                  Icons.home_outlined,
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () => onIndexSelected(1),
                icon: Icon(
                  Icons.store_outlined,
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 23.0,
                    backgroundColor: DeliveryColors.purple,
                    child: IconButton(
                      onPressed: () => onIndexSelected(2),
                      icon: Icon(
                        Icons.shopping_basket_outlined,
                        color: index == 2
                            ? DeliveryColors.green
                            : DeliveryColors.lightGrey,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: cartBloc.totalItems == 0
                        ? const SizedBox.shrink()
                        : CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.pinkAccent,
                            child: Text(
                              cartBloc.totalItems.toString(),
                              style: const TextStyle(
                                color: DeliveryColors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () => onIndexSelected(3),
                icon: Icon(
                  Icons.favorite_border,
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
            ),
            InkWell(
              onTap: () => onIndexSelected(4),
              child: (user?.image == null || user?.image == '')
                  ? const SizedBox.shrink()
                  : CircleAvatar(
                      radius: 15.0,
                      // backgroundColor: Colors.red,
                      child: Image.asset(
                        user!.image,
                        fit: BoxFit.contain,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
