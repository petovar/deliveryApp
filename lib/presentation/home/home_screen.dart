import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/cart/cart_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/home/products/products_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/profile/profile_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                const ProductsScreen(),
                Text('Seleccionado: $currentIndex'),
                CartScreen(
                  onShopping: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                Text('Seleccionado: $currentIndex'),
                const ProfileScreen(),
              ],
            ),
          ),
          _DeliveryNavigatorBar(
              index: currentIndex,
              onIndexSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
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
              child: CircleAvatar(
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
              child: const CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
