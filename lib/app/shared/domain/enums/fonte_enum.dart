// ignore_for_file: constant_identifier_names

import '../../../../generated/l10n.dart';

enum FonteEnum {
  CDHU,
  CONSEMAVI_2017_2020,
  CONSEMAVI_2021_2024,
  DECRETO_58756_2019_DEMAIS,
  DECRETO_58756_2019_SABESP,
  SABESP_2020,
  SABESP_2022_2023,
  PARALELEPIPEDO,
  PAVIMENTACAO,
  CALCADA,
  SPOBRAS,
}

extension FonteEnumExtension on FonteEnum {
  String get typeName {
    return S.current.fonteNameSchema(toString());
  }
}
