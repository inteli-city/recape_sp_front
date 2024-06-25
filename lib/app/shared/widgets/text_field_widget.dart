import 'package:flutter/services.dart';
import 'package:recape_sp_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final bool isEnable;
  final String? Function(String?)? validation;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;

  const TextFieldWidget({
    super.key,
    this.controller,
    required this.title,
    this.hintText,
    this.validation,
    required this.onChanged,
    this.inputFormatters,
    this.initialValue,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          TextFormField(
            enabled: isEnable,
            initialValue: initialValue,
            controller: controller,
            inputFormatters: inputFormatters,
            textAlign: TextAlign.start,
            cursorColor: AppColors.primaryBlue,
            style: Theme.of(context).textTheme.bodyMedium,
            validator: validation,
            onChanged: onChanged,
            decoration: InputDecoration(
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                hintText: hintText,
                suffixIconColor: AppColors.primaryBlue,
                filled: true,
                errorStyle: TextStyle(
                  color: AppColors.red,
                  fontSize: ScreenHelper.width(context) <
                          ScreenHelper.breakpointTablet
                      ? 14
                      : 16,
                  height: 1,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryBlue, width: 2))),
          ),
        ],
      ),
    );
  }
}
