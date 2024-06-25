// ignore_for_file: constant_identifier_names

import '../../../../generated/l10n.dart';

enum ActiveEnum { NONE, ATIVO, INATIVO }

extension ActiveEnumExtension on ActiveEnum {
  String get typeName {
    return S.current.activeNameSchema(toString());
  }
}
