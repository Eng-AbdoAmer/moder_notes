import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final int? mLines;
  final String? initialValue;
  final String? Function(String?)? valid;
  final Function(String?)? onSave;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    Key? key,
    required this.hint,
    this.keyboardType,
    this.valid,
    this.onSave,
    this.initialValue,
    this.mLines,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onSaved: onSave,
        maxLines: mLines,
        validator: valid,
        keyboardType: keyboardType,
        obscureText: isPassword,
        initialValue: initialValue,
        decoration: InputDecoration(
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black, width: 2),
            )),
      ),
    );
  }
}
