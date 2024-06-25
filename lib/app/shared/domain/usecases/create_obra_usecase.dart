import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import '../../helpers/errors/errors.dart';
import '../enums/fonte_enum.dart';
import '../enums/revestimento_enum.dart';
import '../enums/status_obra_enum.dart';
import '../enums/subprefeitura_enum.dart';
import '../repositories/obra_repository_interface.dart';

abstract class ICreateObraUsecase {
  Future<Either<Failure, ObraEntity>> call(
      FonteEnum fonte,
      StatusObraEnum status,
      String via,
      String de,
      String ate,
      String viaPadrao,
      String? viaComplemento,
      String? extensao,
      String? area,
      String? dataTermino,
      SubprefeituraEnum subprefeitura,
      RevestimentoEnum? revestimento,
      String? comentarios,
      String file);
}

class CreateObraUsecase implements ICreateObraUsecase {
  final IObraRepository repository;

  CreateObraUsecase(this.repository);

  @override
  Future<Either<Failure, ObraEntity>> call(
      FonteEnum fonte,
      StatusObraEnum status,
      String via,
      String de,
      String ate,
      String viaPadrao,
      String? viaComplemento,
      String? extensao,
      String? area,
      String? dataTermino,
      SubprefeituraEnum subprefeitura,
      RevestimentoEnum? revestimento,
      String? comentarios,
      String file) async {
    return await repository.createObra(
      fonte,
      status,
      via,
      de,
      ate,
      viaPadrao,
      viaComplemento,
      extensao,
      area,
      dataTermino,
      subprefeitura,
      revestimento,
      comentarios,
      file,
    );
  }
}
