import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_project/core/utils/app_colors.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({
    super.key, required this.outputLabelText, required this.inputLabelText, required this.controller,
  });

  final String outputLabelText;
  final String inputLabelText;
  final TextEditingController controller;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          widget.outputLabelText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFDF9),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 357.w,
            ),
            hintText: widget.inputLabelText,
            filled: true,
            fillColor: AppColors.lightPinkColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            prefix: SizedBox(width: 20,)
          ),
        ),
      ],
    );
  }
}
