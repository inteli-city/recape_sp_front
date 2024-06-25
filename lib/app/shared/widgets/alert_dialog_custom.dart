import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class AlertDialogCustom extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AlertDialogCustom({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.only(bottom: 16),
      title: Text(title),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            Modular.to.pop();
          },
          child: Text('Cancelar',
              style: AppTextStyles.headline3.copyWith(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: onPressed,
          child: Text(
            'Confirmar',
            style: AppTextStyles.headline3.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
