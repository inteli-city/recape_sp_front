// ignore_for_file: constant_identifier_names

import '../../../../generated/l10n.dart';

enum StatusGeometriaEnum {
  NOVO,
  PRE_PROCESSADO,
  PROCESSADO,
  APROVADO,
  EDITADO,
}

extension StatusGeometriaEnumExtension on StatusGeometriaEnum {
  String get typeName {
    return S.current.statusGeometriaNameSchema(toString());
  }
}
