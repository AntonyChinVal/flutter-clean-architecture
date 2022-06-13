import 'package:flutter/material.dart';
import 'package:ui/theme/app_colors.dart';
import 'package:ui/theme/fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String placeholder;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isSecure;
  final FocusNode? current;
  final FocusNode? next;
  final FormFieldValidator<String>? validator;
  final TextAlign inputAlign;
  final int? maxLength;
  final bool? enabled;
  final bool readOnly;
  final Function()? onTap;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.label = 'Label',
    this.placeholder = '',
    this.keyboardType = TextInputType.text,
    this.isSecure = false,
    this.textInputAction = TextInputAction.done,
    this.next,
    this.current,
    this.validator,
    this.inputAlign = TextAlign.center,
    this.maxLength,
    this.onTap,
    this.enabled,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: Fonts.label1.copyWith(color: AppColors.white),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: TextFormField(
            readOnly: readOnly,
            enabled: enabled,
            maxLength: maxLength,
            controller: controller,
            style: Fonts.input1,
            obscureText: isSecure,
            keyboardType: keyboardType,
            textAlign: inputAlign,
            textInputAction: textInputAction,
            focusNode: current,
            validator: validator,
            onTap: onTap,
            onFieldSubmitted: (value) {
              if (current != null &&
                  next != null &&
                  textInputAction == TextInputAction.next) {
                current?.unfocus();
                FocusScope.of(context).requestFocus(next);
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: AppColors.white, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: AppColors.white, width: 3)),
              fillColor: AppColors.white,
              hintText: placeholder,
              hintStyle: const TextStyle(color: AppColors.black),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorStyle: const TextStyle(color: AppColors.white),
              helperStyle: const TextStyle(color: Colors.transparent),
            ),
          ),
        )
      ],
    );
  }
}
