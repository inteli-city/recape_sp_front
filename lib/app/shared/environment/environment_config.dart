// ignore_for_file: constant_identifier_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/user_repository_interface.dart';
import 'package:recape_sp_front/app/shared/infra/repositories/obra_repository_http.dart';
import 'package:recape_sp_front/app/shared/infra/repositories/user_repository_http.dart';
import 'package:recape_sp_front/app/shared/infra/repositories/user_repository_mock.dart';

import '../domain/repositories/obra_repository_interface.dart';
import '../helpers/enums/environment_enum.dart';
import '../infra/external/http/obras_datasource.dart';
import '../infra/repositories/obra_repository_mock.dart';

class EnvironmentConfig {
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static const MSS_OBRAS_BASE_URL = String.fromEnvironment(
    'MSS_OBRAS_BASE_URL',
  );

  static const MSS_GAIA = String.fromEnvironment(
    'MSS_GAIA',
  );

  static IObraRepository getObraRepo() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
        (element) => element.name.toLowerCase() == ENV.toLowerCase(),
        orElse: () => EnvironmentEnum.LOCAL);
    if (value == EnvironmentEnum.LOCAL) {
      return ObraRepositoryMock();
    } else {
      return ObraRepositoryHttp(Modular.get<IObrasDatasource>());
    }
  }

  static IUserRepository getUserRepository() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.LOCAL,
    );
    if (value == EnvironmentEnum.LOCAL) {
      return UserRepositoryMock();
    } else {
      return UserRepositoryHttp(
        Modular.get(),
      );
    }
  }
}
