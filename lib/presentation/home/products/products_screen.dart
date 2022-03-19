import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/data/products/in_memory_products.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/widgets/delivery_button.dart';

import '../../../domain/model/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: GridView.builder(
          padding: const EdgeInsets.all(20.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _ItemProduct(product: products[index]);
          }),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

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
              onTap: () {},
              caption: 'Add',
            )
          ],
        ),
      ),
    );
  }
}
