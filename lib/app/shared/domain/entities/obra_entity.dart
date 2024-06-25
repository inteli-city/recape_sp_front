import 'package:recape_sp_front/app/shared/domain/entities/motoverificacao_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/active_enum.dart';

import '../enums/fonte_enum.dart';
import '../enums/geometry_status_enum.dart';
import '../enums/revestimento_enum.dart';
import '../enums/status_obra_enum.dart';
import '../enums/subprefeitura_enum.dart';

class ObraEntity {
  final String? id;
  final FonteEnum? fonte;
  final StatusObraEnum? status;
  final String via;
  final String de;
  final String ate;
  final String viaPadrao;
  final String? viaComplemento;
  final SubprefeituraEnum? subprefeitura;
  final String? extensao; //m
  final String? area; //m²
  final String? dataTermino;
  final String dataCriacao;
  final String dataUltimaAtualizacao;
  final RevestimentoEnum? revestimento;
  final String? comentarios;
  final String image; //base64
  final List<String> atualizacoes;
  final Map<String, dynamic>? geometria;
  final StatusGeometriaEnum statusGeometria;
  final ActiveEnum? isActive;
  MotoverificacaoEntity motoverificacao;

  ObraEntity({
    required this.dataCriacao,
    required this.dataUltimaAtualizacao,
    required this.image,
    this.id,
    this.fonte,
    this.status,
    required this.via,
    required this.de,
    required this.ate,
    required this.subprefeitura,
    this.extensao,
    this.area,
    this.dataTermino,
    this.revestimento,
    this.comentarios,
    required this.atualizacoes,
    required this.viaPadrao,
    this.viaComplemento,
    this.geometria,
    required this.statusGeometria,
    this.isActive,
    required this.motoverificacao,
  });
}
