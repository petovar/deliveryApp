import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/widgets/delivery_button.dart';

import '../../data/products/in_memory_products.dart';
import '../../domain/model/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
    required this.onShopping,
  }) : super(key: key);

  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Shopoing cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: const _FullCart(),
    );
  }
}

class _FullCart extends StatelessWidget {
  const _FullCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 270,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 15.0),
                  child: _ShoppingCartProduct(product: product),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 30.0,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub total:',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                            ),
                            Text(
                              '\$100.00 USD',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                            Text(
                              'FREE',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL',
                              style: TextStyle(
                                color: Theme.of(context).dividerColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$100.00 USD',
                              style: TextStyle(
                                color: Theme.of(context).dividerColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      DeliveryButton(
                        onTap: () {},
                        caption: 'Chekout',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({
    Key? key,
    required this.onShopping,
  }) : super(key: key);

  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/delivery/sad.png'),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'There are no products yet !!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).dividerColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: DeliveryColors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: onShopping,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Go shopping',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: DeliveryColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  const _ShoppingCartProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Theme.of(context).primaryColor, // DeliveryColors.grey,
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 15,
                ),
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
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              color: DeliveryColors.lightGrey,
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (() {
                                //
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: DeliveryColors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: DeliveryColors.purple,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Theme.of(context).dividerColor),
                              ),
                            ),
                            InkWell(
                              onTap: (() {
                                //
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: DeliveryColors.purple,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: DeliveryColors.white,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$ ${product.price} ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).dividerColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: InkWell(
            onTap: () {
              //
            },
            child: const CircleAvatar(
              backgroundColor: DeliveryColors.pink,
              child: Icon(
                Icons.delete_outline,
                color: DeliveryColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
