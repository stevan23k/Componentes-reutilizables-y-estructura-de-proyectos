import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String placeholder;
  final VoidCallback onClick;

  const new({super.key, required this.placeholder, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: Text(placeholder), onPressed: onClick);
  }
}
