import 'package:flutter/material.dart';

import '../helpers/utils/screen_helper.dart';
import '../themes/app_colors.dart';

class DropDownFieldWidget<T> extends StatelessWidget {
  final String title;
  final void Function(T? value)? onChanged;
  final String? Function(T?)? validation;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  const DropDownFieldWidget({
    Key? key,
    required this.title,
    this.value,
    this.onChanged,
    required this.items,
    this.validation,
  }) : super(key: key);

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
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<T>(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 28,
              ),
              iconEnabledColor: Colors.grey.shade500,
              value: value,
              isExpanded: true,
              onChanged: onChanged,
              items: items,
              validator: validation,
              style: TextStyle(
                color: AppColors.black,
                fontSize:
                    ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                        ? 12
                        : 14,
              ),
              decoration: InputDecoration(
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  suffixIconColor: AppColors.black,
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
          ),
        ],
      ),
    );
  }
}
