import 'package:excel/excel.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/fonte_enum.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/domain/enums/active_enum.dart';
import '../../../shared/domain/enums/geometry_status_enum.dart';
import '../../../shared/domain/enums/status_obra_enum.dart';
import '../../../shared/domain/enums/subprefeitura_enum.dart';
import '../../../shared/domain/usecases/get_all_obras_usecase.dart';
import '../states/base_recape_state.dart';

part 'base_recape_controller.g.dart';

class BaseRecapeController = BaseRecapeControllerBase
    with _$BaseRecapeController;

abstract class BaseRecapeControllerBase with Store {
  final IGetAllObrasUsecase _getAllObrasUsecase;

  BaseRecapeControllerBase(this._getAllObrasUsecase) {
    getAllObras();
  }

  @observable
  BaseRecapeState state = BaseRecapeInitialState();

  @action
  void changeState(BaseRecapeState value) => state = value;

  @observable
  List<ObraEntity> obras = [];

  @action
  void filter({
    String? filterVia,
    SubprefeituraEnum? filterSubprefeitura,
    DateTimeRange? filterDataTermino,
    FonteEnum? filterFonte,
    StatusObraEnum? filterStatusObra,
    String? filterId,
    StatusGeometriaEnum? filterStatusGeometria,
    String? filterLogradouro,
    bool? filterMotoverficacaoConvias,
    bool? filterMotoverficacaoIntelicity,
    DateTimeRange? filterDataConvias,
  }) {
    changeState(BaseRecapeLoadingState());

    final filteredObras = obras.where((obra) {
      try {
        if (filterFonte != null && obra.fonte != filterFonte) return false;
        if (filterVia != null &&
            filterVia.isNotEmpty &&
            !obra.via.toLowerCase().contains(filterVia.toLowerCase())) {
          return false;
        }
        if (filterSubprefeitura != null &&
            obra.subprefeitura != filterSubprefeitura) return false;
        if (filterStatusObra != null && obra.status != filterStatusObra) {
          return false;
        }
        if (filterId != null && filterId.isNotEmpty && obra.id != filterId) {
          return false;
        }
        if (filterStatusGeometria != null &&
            obra.statusGeometria != filterStatusGeometria) return false;
        if (filterLogradouro != null &&
            filterLogradouro.isNotEmpty &&
            !obra.viaPadrao
                .toLowerCase()
                .contains(filterLogradouro.toLowerCase())) return false;
        if (filterMotoverficacaoConvias != null &&
            obra.motoverificacao.motoverificacaoConvias !=
                filterMotoverficacaoConvias) return false;
        if (filterMotoverficacaoIntelicity != null &&
            obra.motoverificacao.motoverificacaoIntelicity !=
                filterMotoverficacaoIntelicity) return false;

        if (filterDataConvias != null) {
          if (obra.motoverificacao.dataMotoverificacaoConvias == null ||
              obra.motoverificacao.dataMotoverificacaoConvias!.isEmpty) {
            return false;
          }

          DateTime dataFormatada;
          try {
            dataFormatada = DateFormat("dd/MM/yyyy")
                .parse(obra.motoverificacao.dataMotoverificacaoConvias!);
          } catch (e) {
            return false;
          }

          bool isInRange = dataFormatada.isAfter(
                  filterDataConvias.start.subtract(const Duration(days: 1))) &&
              dataFormatada
                  .isBefore(filterDataConvias.end.add(const Duration(days: 1)));
          if (!isInRange) return false;
        }

        if (filterDataTermino != null) {
          if (obra.dataTermino == null || obra.dataTermino!.isEmpty) {
            return false;
          }

          DateTime dataFormatada;
          try {
            dataFormatada = DateFormat("dd/MM/yyyy").parse(obra.dataTermino!);
          } catch (e) {
            return false;
          }

          bool isInRange = dataFormatada.isAfter(
                  filterDataTermino.start.subtract(const Duration(days: 1))) &&
              dataFormatada
                  .isBefore(filterDataTermino.end.add(const Duration(days: 1)));
          if (!isInRange) return false;
        }
      } catch (e) {
        return false;
      }

      return true;
    }).toList();

    changeState(BaseRecapeLoadedSuccessState(listObras: filteredObras));
  }

  void clear() async {
    changeState(BaseRecapeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    changeState(BaseRecapeLoadedSuccessState(listObras: obras));
  }

  @action
  Future<void> getAllObras() async {
    changeState(BaseRecapeLoadingState());
    final result = await _getAllObrasUsecase();
    changeState(result.fold((l) => BaseRecapeErrorState(error: l), (list) {
      obras = list;
      return BaseRecapeLoadedSuccessState(listObras: list);
    }));
  }

  @action
  Future<void> createAndExportXlsFile() async {
    final excel = Excel.createExcel();

    // Create a new Excel sheet
    final sheet = excel['Sheet1'];
    final headers = [
      'id',
      'Recurso',
      'Status',
      'Data Término',
      'Via',
      'De',
      'Até',
      'Logradouro Geosampa',
      'Complemento',
      'Subprefeitura',
      'Extensão (m)',
      'Área (m²)',
      'Revestimento',
      'Status Geometria',
      'Geometria',
      'Ativo?',
      'Comentários',
      'Data Criação',
      'Motoverificação Convias',
      'Data Motoverificação Convias',
      'Motoverificação Intelicity',
      'Justificação Intelicity',
      'Data Última Atualização',
      'Lista de atualizações',
    ];
    sheet.appendRow(headers);
    for (var e in obras) {
      sheet.appendRow([
        e.id,
        e.fonte!.typeName,
        e.status!.typeName,
        e.dataTermino,
        e.via,
        e.de,
        e.ate,
        e.viaPadrao,
        e.viaComplemento ?? '',
        e.subprefeitura == null ? '' : e.subprefeitura!.name,
        e.extensao,
        e.area,
        e.revestimento == null ? '' : e.revestimento!.name,
        e.statusGeometria.typeName,
        e.geometria ?? '',
        e.isActive!.typeName,
        e.comentarios,
        e.dataCriacao,
        e.motoverificacao.motoverificacaoConvias == null
            ? ''
            : e.motoverificacao.motoverificacaoConvias!
                ? 'SIM'
                : 'NÃO',
        e.motoverificacao.dataMotoverificacaoConvias ?? '',
        e.motoverificacao.motoverificacaoIntelicity == null
            ? ''
            : e.motoverificacao.motoverificacaoIntelicity!
                ? 'SIM'
                : 'NÃO',
        e.motoverificacao.justificativaIntelicity ?? '',
        e.dataUltimaAtualizacao,
        e.atualizacoes
      ]);
    }

    final uint8List = Uint8List.fromList(excel.encode()!);

    FileSaver.instance.saveFile(name: 'obras.xlsx', bytes: uint8List);
  }
}
