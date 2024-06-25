import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/base-recape/controllers/create_obra_controller.dart';
import 'package:recape_sp_front/app/modules/base-recape/ui/base_recape_page.dart';
import 'package:recape_sp_front/app/shared/datasource/external/http/obras_datasource_impl.dart';
import 'package:recape_sp_front/app/shared/domain/usecases/update_motoverificacao_usecase.dart';
import 'package:recape_sp_front/app/shared/helpers/network/http_clients/dio_http_client.dart';
import 'package:recape_sp_front/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:recape_sp_front/app/shared/infra/external/http/obras_datasource.dart';
import '../../shared/domain/repositories/obra_repository_interface.dart';
import '../../shared/domain/usecases/create_obra_usecase.dart';
import '../../shared/domain/usecases/delete_obra_usecase.dart';
import '../../shared/domain/usecases/get_all_obras_usecase.dart';
import '../../shared/domain/usecases/update_obra_usecase.dart';
import '../../shared/environment/environment_config.dart';
import 'controllers/base_recape_controller.dart';

class BaseRecapeModule extends Module {
  @override
  void binds(i) {
    i.add<IHttpClient>(
      () => DioHttpClient(
          baseApiUrl: EnvironmentConfig.MSS_OBRAS_BASE_URL, interceptors: []),
    );

    i.addLazySingleton<IObrasDatasource>(ObrasDatasourceImpl.new);
    i.addLazySingleton<IObraRepository>(() => EnvironmentConfig.getObraRepo());
    i.addLazySingleton<IGetAllObrasUsecase>(GetAllObrasUsecase.new);
    i.addLazySingleton<ICreateObraUsecase>(CreateObraUsecase.new);
    i.addLazySingleton<IUpdateObraUsecase>(UpdateObraUsecase.new);
    i.addLazySingleton<IDeleteObraUsecase>(DeleteObraUsecase.new);
    i.addLazySingleton<IUpdateMotoverificacaoUsecase>(
        UpdateMotoverificacaoUsecase.new);
    i.addLazySingleton<BaseRecapeController>(BaseRecapeController.new);
    i.add<CreateObraController>(CreateObraController.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const BaseRecapePage(),
    );
  }
}
