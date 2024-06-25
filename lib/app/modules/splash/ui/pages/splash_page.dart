import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/user/stores/user_store.dart';
import 'package:recape_sp_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:recape_sp_front/app/shared/themes/app_colors.dart';
import 'package:recape_sp_front/generated/l10n.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final UserStore store = Modular.get<UserStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Observer(builder: (_) {
        return Center(
          child: !store.hasError
              ? CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColors.white,
                )
              : ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 600,
                    maxWidth: 600,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      ScreenHelper.width(context) <
                              ScreenHelper.breakpointMobile
                          ? 8
                          : 16,
                    ),
                    child: Card(
                      surfaceTintColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 20,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    S.of(context).textErrorHome,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red)),
                                    child: Text(store.error!,
                                        style:
                                            const TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
