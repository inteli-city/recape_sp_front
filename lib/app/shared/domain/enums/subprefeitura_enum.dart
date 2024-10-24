// ignore_for_file: constant_identifier_names

import 'package:recape_sp_front/generated/l10n.dart';

enum SubprefeituraEnum {
  AD,
  AF,
  BT,
  CL,
  CS,
  CT,
  CV,
  EM,
  FB,
  G,
  IP,
  IQ,
  IT,
  JA,
  JT,
  LA,
  MB,
  MG,
  MO,
  MP,
  PA,
  PE,
  PI,
  PJ,
  PR,
  SA,
  SB,
  SE,
  SM,
  ST,
  VM,
  VP,
}

extension SubprefeituraEnumExtension on SubprefeituraEnum {
  String get typeName {
    return S.current.subprefeituraNameSchema(toString());
  }
}
