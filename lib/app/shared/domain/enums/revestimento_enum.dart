// ignore_for_file: constant_identifier_names

import '../../../../generated/l10n.dart';

enum RevestimentoEnum { NONE, SMA, CBUQ, CONCRETO, INTERTRAVADO }

extension RevestimentoEnumExtension on RevestimentoEnum {
  String get typeName {
    return S.current.revestimentoNameSchema(toString());
  }
}
