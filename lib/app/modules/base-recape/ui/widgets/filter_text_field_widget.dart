import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../shared/themes/app_colors.dart';

class FilterTextFieldWidget extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final List<TextInputFormatter>? inputFormatters;

  final Function(String)? onChanged;

  const FilterTextFieldWidget(
      {super.key,
      required this.title,
      this.hintText,
      this.validation,
      this.onChanged,
      this.inputFormatters,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: onChanged,
        validator: validation,
        controller: controller,
        inputFormatters: inputFormatters,
        cursorColor: AppColors.primaryBlue,
        decoration: InputDecoration(
            hintText: hintText,
            fillColor: AppColors.white,
            hoverColor: AppColors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            labelText: title,
            labelStyle: TextStyle(
              color: AppColors.black,
              fontSize:
                  ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                      ? 14
                      : 16,
              height: 1,
            ),
            floatingLabelStyle: TextStyle(
              color: AppColors.primaryBlue,
              fontSize:
                  ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                      ? 16
                      : 18,
              height: 1,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.primaryBlue, width: 2))));
  }
}
