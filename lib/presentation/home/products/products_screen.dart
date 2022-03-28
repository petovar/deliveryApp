import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/cart/cart_bloc.dart';
// import 'package:theme_and_clean_architecture_state_management/data/products/in_memory_products.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/home/products/products_bloc.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/widgets/delivery_button.dart';

import '../../../domain/model/product.dart';
import '../../../domain/repository/api_repository_interface.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen._({Key? key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsBLoC(
        apiRespositoryInteface: context.read<ApiRespositoryInteface>(),
      )..loadProduts(),
      builder: (_, __) => const ProductsScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsBloc = context.watch<ProductsBLoC>();
    final cartBloc = context.watch<CartBLoC>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: productsBloc.productList.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.all(20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: productsBloc.productList.length,
              itemBuilder: (context, index) {
                final product = productsBloc.productList[index];
                return _ItemProduct(
                  product: product,
                  onTap: () {
                    print('Va a agregar elemento...');
                    cartBloc.add(product);
                    // productsBloc.
                  },
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).primaryColor, // DeliveryColors.grey,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          color: DeliveryColors.lightGrey,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ ${product.price} USD',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).dividerColor),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              padding: const EdgeInsets.all(4),
              onTap: onTap,
              caption: 'Add',
            )
          ],
        ),
      ),
    );
  }
}
