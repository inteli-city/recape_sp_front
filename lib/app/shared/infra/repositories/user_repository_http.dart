import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/user_repository_interface.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';
import 'package:recape_sp_front/app/shared/infra/external/http/user_datasource.dart';

class UserRepositoryHttp implements IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepositoryHttp(this._userDatasource);

  @override
  Future<Either<Failure, UserEntity>> loginUser() async {
    try {
      final result = await _userDatasource.loginUser();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }
}
