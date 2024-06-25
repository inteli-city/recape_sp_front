import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import '../../helpers/errors/errors.dart';
import '../repositories/obra_repository_interface.dart';

abstract class IUpdateObraUsecase {
  Future<Either<Failure, ObraEntity>> call(ObraEntity obra);
}

class UpdateObraUsecase implements IUpdateObraUsecase {
  final IObraRepository repository;

  UpdateObraUsecase(this.repository);

  @override
  Future<Either<Failure, ObraEntity>> call(ObraEntity obra) async {
    return await repository.updateObra(obra);
  }
}
