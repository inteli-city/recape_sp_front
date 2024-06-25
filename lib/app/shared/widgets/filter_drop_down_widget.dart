import 'package:flutter/material.dart';

import '../helpers/utils/screen_helper.dart';
import '../themes/app_colors.dart';

class FilterDropDownWidget<T> extends StatelessWidget {
  final GlobalKey<FormFieldState> dropDownKey;
  final String title;
  final void Function(T? value)? onChanged;
  final List<DropdownMenuItem<T>> items;

  const FilterDropDownWidget({
    super.key,
    required this.title,
    this.onChanged,
    required this.items,
    required this.dropDownKey,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<T>(
        key: dropDownKey,
        onChanged: onChanged,
        items: items,
        style: Theme.of(context).textTheme.bodyMedium,
        dropdownColor: Colors.white,
        focusColor: Colors.white,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            suffixIconColor: AppColors.black,
            filled: true,
            labelText: title,
            labelStyle: TextStyle(
              color: AppColors.black,
              fontSize:
                  ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                      ? 14
                      : 16,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.primaryBlue, width: 2))),
      ),
    );
  }
}
