import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/shared/themes/app_colors.dart';
import 'package:recape_sp_front/generated/l10n.dart';
import 'shared/themes/themes_constants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cadastro Obras',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      color: AppColors.white,
      theme: lightTheme,
      themeMode: ThemeMode.system,
    );
  }
}
