import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import '../../helpers/errors/errors.dart';
import '../enums/fonte_enum.dart';
import '../enums/revestimento_enum.dart';
import '../enums/status_obra_enum.dart';
import '../enums/subprefeitura_enum.dart';

abstract class IObraRepository {
  Future<Either<Failure, List<ObraEntity>>> getAllObras();
  Future<Either<Failure, ObraEntity>> createObra(
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
    String file,
  );
  Future<Either<Failure, ObraEntity>> deleteObra(String id);
  Future<Either<Failure, ObraEntity>> updateObra(ObraEntity obraToUpdate);
  Future<Either<Failure, List<ObraEntity>>> updateMotoverificacao(
      Map<String, dynamic> json);
}
