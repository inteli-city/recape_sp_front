import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/role_enum.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/user_repository_interface.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';

class UserRepositoryMock implements IUserRepository {
  UserEntity user = UserEntity(
    userId: '125fb34e-aacf-4a47-9914-82ea64ff9f32',
    name: 'Gabriel Godoy',
    email: 'gabriel.godoybz@hotmail.com',
    enabled: true,
    role: RoleEnum.ADMIN,
  );

  @override
  Future<Either<Failure, UserEntity>> loginUser() async {
    if (user.enabled == false) {
      return Left(LoginError(
        errorMessage: 'Usuário desabilitado',
        stackTrace: StackTrace.current,
      ));
    }
    return Right(user);
  }
}
