import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import '../../helpers/errors/errors.dart';
import '../repositories/obra_repository_interface.dart';

abstract class IDeleteObraUsecase {
  Future<Either<Failure, ObraEntity>> call(String id);
}

class DeleteObraUsecase implements IDeleteObraUsecase {
  final IObraRepository repository;

  DeleteObraUsecase(this.repository);

  @override
  Future<Either<Failure, ObraEntity>> call(String id) async {
    return await repository.deleteObra(id);
  }
}
