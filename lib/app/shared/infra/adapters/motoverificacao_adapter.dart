import 'package:recape_sp_front/app/shared/domain/entities/motoverificacao_entity.dart';

class MotoverificacaoAdapter {
  static List<MotoverificacaoEntity> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }

  static MotoverificacaoEntity fromJson(Map<String, dynamic> json) {
    return MotoverificacaoEntity(
      motoverificacaoConvias: json['motoverificacao_convias'],
      dataMotoverificacaoConvias: json['data_motoverificacao_convias'],
      motoverificacaoIntelicity: json['motoverificacao_intelicity'],
      justificativaIntelicity: json['justificativa_intelicity'],
    );
  }

  static Map<String, dynamic> toJson(MotoverificacaoEntity form) {
    return {
      'motoverificacao_convias': form.motoverificacaoConvias,
      'data_motoverificacao_convias': form.dataMotoverificacaoConvias,
      'motoverificacao_intelicity': form.motoverificacaoIntelicity,
      'justificativa_intelicity': form.justificativaIntelicity,
    };
  }
}
