import 'package:recape_sp_front/app/shared/domain/entities/motoverificacao_entity.dart';
import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';
import 'package:recape_sp_front/app/shared/domain/enums/active_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/fonte_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/geometry_status_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/revestimento_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/status_obra_enum.dart';
import 'package:recape_sp_front/app/shared/domain/enums/subprefeitura_enum.dart';
import 'package:recape_sp_front/app/shared/infra/adapters/motoverificacao_adapter.dart';

class ObraAdapter {
  static List<ObraEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static ObraEntity fromJson(Map<String, dynamic> json) {
    return ObraEntity(
      id: json['obra_id'],
      fonte: FonteEnum.values
          .firstWhere((element) => element.name == json['fonte']),
      status: StatusObraEnum.values
          .firstWhere((element) => element.name == json['status_obra']),
      via: json['via'],
      de: json['de'],
      ate: json['ate'],
      viaPadrao: json['via_padrao'],
      viaComplemento: json['via_complemento'],
      subprefeitura: SubprefeituraEnum.values
          .firstWhere((element) => element.name == json['subprefeitura']),
      dataTermino: json['data_termino'],
      dataUltimaAtualizacao: json['data_atualizacao'],
      dataCriacao: json['data_criacao'],
      extensao: json['extensao'],
      revestimento: json['revestimento'] == null
          ? null
          : RevestimentoEnum.values
              .firstWhere((element) => element.name == json['revestimento']),
      atualizacoes: (json['atualizacoes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      area: json['area'],
      comentarios: json['comentarios'],
      image: json['image'],
      geometria: json['geometria'],
      statusGeometria: StatusGeometriaEnum.values
          .firstWhere((element) => element.name == json['status_geometry']),
      isActive: ActiveEnum.values
          .firstWhere((element) => element.name == json['is_active']),
      motoverificacao: MotoverificacaoAdapter.fromJson(json),
    );
  }

  static Map<String, dynamic> toJson(ObraEntity form) {
    return {
      "obra_id": form.id,
      "fonte": form.fonte!.name,
      "status_obra": form.status!.name,
      "data_termino": form.dataTermino == '' ? null : form.dataTermino,
      "via": form.via,
      "de": form.de,
      "ate": form.ate,
      "subprefeitura": form.subprefeitura?.name,
      "extensao": form.extensao,
      "area": form.area,
      "revestimento": (form.revestimento == null ||
              form.revestimento == RevestimentoEnum.NONE)
          ? null
          : form.revestimento!.name,
      'image': form.image,
      "comentarios": form.comentarios,
      "via_padrao": form.viaPadrao,
      "via_complemento": form.viaComplemento,
      "status_geometry": form.statusGeometria.name,
      "is_active": form.isActive?.name,
    };
  }

  static ObraEntity copyWith(
    ObraEntity form, {
    String? id,
    FonteEnum? fonte,
    StatusObraEnum? status,
    String? via,
    String? de,
    String? ate,
    String? viaPadrao,
    String? viaComplemento,
    SubprefeituraEnum? subprefeitura,
    String? extensao,
    String? area,
    String? dataTermino,
    RevestimentoEnum? revestimento,
    String? comentarios,
    String? image,
    List<String>? atualizacoes,
    Map<String, dynamic>? geometria,
    StatusGeometriaEnum? statusGeometria,
    ActiveEnum? isActive,
    MotoverificacaoEntity? motoverificacao,
  }) {
    return ObraEntity(
      id: id ?? form.id,
      fonte: fonte ?? form.fonte,
      status: status ?? form.status,
      via: via ?? form.via,
      de: de ?? form.de,
      ate: ate ?? form.ate,
      viaPadrao: viaPadrao ?? form.viaPadrao,
      viaComplemento: viaComplemento ?? form.viaComplemento,
      subprefeitura: subprefeitura ?? form.subprefeitura,
      extensao: extensao ?? form.extensao,
      area: area ?? form.area,
      dataTermino: dataTermino ?? form.dataTermino,
      dataCriacao: form.dataCriacao,
      dataUltimaAtualizacao: form.dataUltimaAtualizacao,
      revestimento: revestimento ?? form.revestimento,
      comentarios: comentarios ?? form.comentarios,
      image: image ?? form.image,
      atualizacoes: atualizacoes ?? form.atualizacoes,
      geometria: geometria ?? form.geometria,
      statusGeometria: statusGeometria ?? form.statusGeometria,
      isActive: isActive ?? form.isActive,
      motoverificacao: motoverificacao ?? form.motoverificacao,
    );
  }
}
