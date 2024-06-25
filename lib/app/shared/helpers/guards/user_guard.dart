import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/user/stores/user_store.dart';

class UserGuard extends RouteGuard {
  UserGuard({String redirectTo = '/'}) : super(redirectTo: redirectTo);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    return Modular.get<UserStore>().user != null;
  }
}
