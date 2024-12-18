import 'package:flutter/material.dart';
import 'package:talknest/utils/Color.dart';

class TextFieldCustom extends StatelessWidget {
  final String label;
  final String hintText;
  final bool? isSequred;
  final Widget? treling;

  const TextFieldCustom(
      {super.key,
        required this.label,
        required this.hintText,
        this.isSequred,
        this.treling,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSequred == true ? true : false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(.15),
                width: 1.5,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColor.primary,
                width: 2,
              )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          labelText: label,
        hintText: hintText,
        suffixIcon: treling,
      ),

    );
  }
}
