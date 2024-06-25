import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';

import '../../../helpers/errors/errors.dart';
import '../../repositories/user_repository_interface.dart';

abstract class ILoginUserUsecase {
  Future<Either<Failure, UserEntity>> call(String accessToken);
}

class LoginUserUsecase implements ILoginUserUsecase {
  final IUserRepository repository;

  LoginUserUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(String accessToken) async {
    return await repository.loginUser();
  }
}
