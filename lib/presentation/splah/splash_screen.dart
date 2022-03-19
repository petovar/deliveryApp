import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/login/login_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      (() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset('assets/delivery/logo_delivery.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'DeliveryApp',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: DeliveryColors.white,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
