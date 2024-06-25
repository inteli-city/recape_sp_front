import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';
import 'package:recape_sp_front/app/shared/infra/external/http/obras_datasource.dart';
import '../../domain/enums/fonte_enum.dart';
import '../../domain/enums/revestimento_enum.dart';
import '../../domain/enums/status_obra_enum.dart';
import '../../domain/enums/subprefeitura_enum.dart';
import '../../domain/repositories/obra_repository_interface.dart';

class ObraRepositoryHttp implements IObraRepository {
  final IObrasDatasource datasouce;

  ObraRepositoryHttp(this.datasouce);

  @override
  Future<Either<Failure, List<ObraEntity>>> getAllObras() async {
    try {
      var data = await datasouce.getAllObras();
      return right(data);
    } on DioException catch (e) {
      return left(
        GetAllObrasError(
          errorMessage: e.response?.data,
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  @override
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
      String file) async {
    try {
      var obraCreated = await datasouce.postCreateObra(
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
      return right(obraCreated);
    } on DioException catch (e) {
      return left(
        CreateObraError(
          errorMessage: e.response?.data,
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ObraEntity>> deleteObra(String id) async {
    try {
      var obraDeleted = await datasouce.postDeleteObra(id);
      return right(obraDeleted);
    } on DioException catch (e) {
      return left(
        DeleteObraError(
          errorMessage: e.response?.data,
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ObraEntity>> updateObra(
      ObraEntity obraToUpdate) async {
    try {
      var obraUpdated = await datasouce.postUpdateObra(obraToUpdate);
      return right(obraUpdated);
    } on DioException catch (e) {
      return left(
        UpdateObraError(
          errorMessage: e.response?.data,
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ObraEntity>>> updateMotoverificacao(
      Map<String, dynamic> json) async {
    try {
      var obraUpdated = await datasouce.postUpdateMotoverificacao(json);
      return right(obraUpdated);
    } on DioException catch (e) {
      return left(
        UpdateMotoverificacaoError(
          errorMessage: e.response?.data,
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
