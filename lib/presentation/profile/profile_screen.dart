import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                        'assets/profile/profile.png',
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
                          'Email:',
                          style: TextStyle(
                            color: DeliveryColors.green,
                          ),
                        ),
                        Text(
                          'correo@gmial.com',
                          style:
                              TextStyle(color: Theme.of(context).dividerColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Dark mode',
                            ),
                            Switch(
                              activeColor: Theme.of(context).dividerColor,
                              value: true,
                              onChanged: (value) {},
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
                      onPressed: () {},
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
      ),
    );
  }
}
