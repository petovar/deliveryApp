import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/home/home_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/widgets/delivery_button.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: logoSize,
                  left: -25,
                  right: -25,
                  height: size.width + 50,
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.red,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(size.width),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.5,
                          1.0,
                        ],
                        colors: deliveryGradients,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: logoSize,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('assets/delivery/logo_delivery.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Username',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'username',
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.lock_outlined),
                        hintText: 'password',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: DeliveryButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                  );
                },
                caption: 'Login',
              )),
        ],
      ),
    );
  }
}
