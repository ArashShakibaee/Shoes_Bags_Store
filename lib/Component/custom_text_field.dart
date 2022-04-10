import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart' as valid;
import 'package:shoes_store/Component/custom_icon.dart';
import 'package:shoes_store/Values/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final valid.FormFieldValidator validator;
  final VoidCallback? onPressed;
  final String title;
  final String? hintText;
  final String? assetIcon;
  final bool? isButton;
  final bool isObscure;
  final bool onLoginScreen;

  const CustomTextField({
    Key? key,
    this.assetIcon,
    required this.title,
    this.hintText,
    this.isButton,
    required this.isObscure,
    required this.onLoginScreen,
    this.onPressed,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(title),
          const SizedBox(
            height: 2,
          ),
      TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isObscure,
        cursorColor: onLoginScreen ? AppColor.teal : AppColor.deepGrey,
        cursorRadius: const Radius.circular(10),
        cursorWidth: 2,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: isButton!
              ? CustomIcon(
                  color: onLoginScreen ? Colors.grey : Colors.grey.shade400,
                  isButton: true,
                  isGestureDetector: false,
                  assetName: assetIcon!,
                  onPressed: onPressed!,
                )
              : null,

          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          //حالت عادی بوردر
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: onLoginScreen ? AppColor.teal : AppColor.deepGrey),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          // نغییر حالت بوردر زمانی که کاربر روی بوردر کلیک میکند
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: onLoginScreen ? AppColor.teal : AppColor.deepGrey),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          // تغییر حالت بوردر زمانی که کاربر اطلاعات اشتباه وارد میکند
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    ]);
  }
}
