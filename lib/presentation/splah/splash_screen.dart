import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/repository/local_storage_repository.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';
import 'splash_bloc.dart';
import '../../domain/repository/api_repository_interface.dart';
import '../theme.dart';

class SplashScreen extends StatefulWidget {
  //
  const SplashScreen._({Key? key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBLoC(
        apiRespositoryInteface: context.read<ApiRespositoryInteface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => const SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //
  void _init() async {
    //
    final bloc = context.read<SplashBLoC>();
    final result = await bloc.validateSession();

    if (result) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeScreen.init(context),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginScreen.init(context),
        ),
      );
    }
    //
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        //Se ejecuta solo luego de renderizar
        _init();
      },
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
