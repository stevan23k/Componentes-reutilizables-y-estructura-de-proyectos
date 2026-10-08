import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final TextInputType typeKB;
  final TextEditingController cnt;
  final bool isPorcent;
  final String? Function(String?)? validator;

  const new({
    super.key,
    required this.placeholder,
    required this.typeKB,
    required this.cnt,
    this.isPorcent = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cnt,
      keyboardType: typeKB,
      validator: validator,
      decoration: InputDecoration(
        labelText: placeholder,
        suffixText: isPorcent ? '%' : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
