import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/obra_repository_interface.dart';
import 'package:dartz/dartz.dart';
import '../../helpers/errors/errors.dart';

abstract class IGetAllObrasUsecase {
  Future<Either<Failure, List<ObraEntity>>> call();
}

class GetAllObrasUsecase implements IGetAllObrasUsecase {
  final IObraRepository repository;

  GetAllObrasUsecase(this.repository);

  @override
  Future<Either<Failure, List<ObraEntity>>> call() async {
    return await repository.getAllObras();
  }
}
