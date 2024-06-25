import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import '../../helpers/errors/errors.dart';
import '../repositories/obra_repository_interface.dart';

abstract class IUpdateMotoverificacaoUsecase {
  Future<Either<Failure, List<ObraEntity>>> call(
      {required Map<String, dynamic> json});
}

class UpdateMotoverificacaoUsecase implements IUpdateMotoverificacaoUsecase {
  final IObraRepository repository;

  UpdateMotoverificacaoUsecase(this.repository);

  @override
  Future<Either<Failure, List<ObraEntity>>> call(
      {required Map<String, dynamic> json}) async {
    return await repository.updateMotoverificacao(json);
  }
}
