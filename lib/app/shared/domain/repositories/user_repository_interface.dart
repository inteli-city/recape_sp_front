import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';

import '../../helpers/errors/errors.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserEntity>> loginUser();
}
