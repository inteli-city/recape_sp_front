import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/splash/ui/pages/splash_page.dart';
import 'package:recape_sp_front/app/modules/user/stores/user_store.dart';
import 'package:recape_sp_front/app/shared/datasource/external/http/user_datasource_impl.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/uri_repository.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/user_repository_interface.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/user/get_params_usecase.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/user/login_user_usecase.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/user/set_params.dart';
import 'package:recape_sp_front/app/shared/environment/environment_config.dart';
import 'package:recape_sp_front/app/shared/helpers/guards/user_guard.dart';
import 'package:recape_sp_front/app/shared/helpers/network/http_clients/dio_http_client.dart';
import 'package:recape_sp_front/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:recape_sp_front/app/shared/helpers/network/inteceptors/auth_interceptor.dart';
import 'package:recape_sp_front/app/shared/infra/external/http/user_datasource.dart';
import 'package:recape_sp_front/app/shared/infra/repositories/uri_repository_impl.dart';
import 'package:logger/logger.dart';

import 'modules/base-recape/base_recape_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<IHttpClient>(
      () => DioHttpClient(
        baseApiUrl: EnvironmentConfig.MSS_GAIA,
        interceptors: [AuthInterceptor()],
      ),
    );
    i.addLazySingleton(Logger.new);
    i.addSingleton<UriRepository>(UriRepositoryImpl.new);
    i.addLazySingleton<GetParams>(GetParamsImpl.new);
    i.addLazySingleton<SetParams>(SetParamsImpl.new);
    i.addLazySingleton(UserStore.new);
    i.addSingleton<ILoginUserUsecase>(LoginUserUsecase.new);
    i.addSingleton<IUserRepository>(
        () => EnvironmentConfig.getUserRepository());
    i.addSingleton<IUserDatasource>(UserDatasourceImpl.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SplashPage(),
    );
    r.module('/home', module: BaseRecapeModule(), guards: [UserGuard()]);
  }
}
