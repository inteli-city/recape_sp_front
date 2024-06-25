import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/shared/domain/entities/params.dart';
import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/user/get_params_usecase.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/user/login_user_usecase.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/user/set_params.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final ILoginUserUsecase _loginUser;
  final GetParams _getParams;
  final SetParams _setParams;
  final Logger logger;

  UserStoreBase(
      this._loginUser, this._getParams, this.logger, this._setParams) {
    if (Modular.args.uri.toString().contains('/?')) {
      final result = _setParams(Modular.args.uri);
      result.fold((l) => logger.i(l.errorMessage), (r) => null);
    }
    checkParams();
    if (hasError) {
      Modular.to.navigate('/');
    } else {
      checkLogin().then((value) {
        if (user == null) {
          Modular.to.navigate('/');
        } else {
          Modular.to.navigate('/home');
        }
      });
    }
  }

  @observable
  UserEntity? user;

  @observable
  Params? params;

  @observable
  String? error;

  @computed
  bool get hasError => error != null;

  @action
  void checkParams() {
    final result = _getParams();
    result.fold((l) {
      error = l.errorMessage;
      params = null;
      logger.i('Error: $error');
    }, (r) {
      params = r;
      error = null;
      logger.i('Params: ${params!.idToken}');
    });
  }

  Future<void> checkLogin() async {
    await _loginUser(params!.idToken!).then(
      (value) => value.fold((error) {
        // GlobalSnackBar.error(error.errorMessage);
        this.error = error.errorMessage;
        user == null;
      }, (user) {
        this.user = user;
      }),
    );
  }
}
