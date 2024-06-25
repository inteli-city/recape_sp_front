import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';
import 'package:recape_sp_front/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:recape_sp_front/app/shared/helpers/network/model/http_client_error.dart';
import 'package:recape_sp_front/app/shared/infra/adapters/obra_adapter.dart';
import '../../../domain/enums/fonte_enum.dart';
import '../../../domain/enums/revestimento_enum.dart';
import '../../../domain/enums/status_obra_enum.dart';
import '../../../domain/enums/subprefeitura_enum.dart';
import '../../../infra/external/http/obras_datasource.dart';

class ObrasDatasourceImpl extends IObrasDatasource {
  final IHttpClient _httpClient;

  ObrasDatasourceImpl(this._httpClient);

  @override
  Future<List<ObraEntity>> getAllObras() async {
    try {
      var response = await _httpClient.get('/get-all-obras');
      return ObraAdapter.fromJsonList(response.data['all_obras']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw GetAllObrasError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<ObraEntity> postCreateObra(
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
      var json = {
        'fonte': fonte.name,
        'status_obra': status.name,
        'via': via,
        'de': de,
        'ate': ate,
        'via_padrao': viaPadrao,
        'via_complemento': viaComplemento,
        'extensao': extensao,
        'area': area,
        'data_termino': dataTermino,
        'subprefeitura': subprefeitura.name,
        'revestimento':
            (revestimento == null || revestimento == RevestimentoEnum.NONE)
                ? null
                : revestimento.name,
        'comentarios': comentarios,
        'image': file
      };
      var response = await _httpClient.post('/create-obra', data: json);
      return ObraAdapter.fromJson(response.data);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw CreateObraError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<ObraEntity> postDeleteObra(String id) async {
    try {
      var response = await _httpClient.post(
        '/delete-obra',
        data: {
          'obraId': id,
        },
      );
      return ObraAdapter.fromJson(response.data);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw DeleteObraError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<ObraEntity> postUpdateObra(ObraEntity obra) async {
    try {
      var response = await _httpClient.post('/update-obra',
          data: ObraAdapter.toJson(obra));
      return ObraAdapter.fromJson(response.data);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UpdateObraError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<List<ObraEntity>> postUpdateMotoverificacao(
      Map<String, dynamic> json) async {
    try {
      var response =
          await _httpClient.post('/update-motoverificacao', data: json);
      return ObraAdapter.fromJsonList(response.data['all_obras']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw UpdateMotoverificacaoError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }
}
