import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton({
    Key? key,
    required this.onTap,
    required this.caption,
    this.padding = const EdgeInsets.all(20.0),
  }) : super(key: key);

  final VoidCallback onTap;
  final String caption;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: deliveryGradients,
          ),
        ),
        // height: 40.0,
        child: Padding(
          padding: padding,
          child: Text(
            caption,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
