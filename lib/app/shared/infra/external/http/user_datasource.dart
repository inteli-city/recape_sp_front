import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';

abstract class IUserDatasource {
  Future<UserEntity> loginUser();
}
