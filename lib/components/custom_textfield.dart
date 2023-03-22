import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final hint;
  final onChanged;
  final bool? obscure;
  final String? initialValue;
  final String label;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField(
      {Key? key,
      required this.controller,
      this.initialValue,
      required this.hint,
      this.obscure,
      this.onChanged,
      required this.label,
      this.keyboardType,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure == null ? false : true,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade300)),
        border: const OutlineInputBorder(),
        hintText: hint,
        label: Text(label),
        floatingLabelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.focused)
              ? Colors.blue.shade300
              : Colors.grey;
          return TextStyle(color: color);
        }),
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
      initialValue: initialValue,
    );
  }
}
