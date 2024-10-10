// ignore_for_file: constant_identifier_names

import '../../../../generated/l10n.dart';

enum StatusObraEnum {
  SUSPENSO,
  PLANEJADO,
  A_CONTRATAR,
  A_CONTRATAR_CURTO_PRAZO,
  CONTRATADO,
  EM_EXECUCAO,
  CONCLUIDO_RATIFICAR,
  CONCLUIDO,
  EXCLUIDO
}

extension StatusObraEnumExtension on StatusObraEnum {
  String get typeName {
    return S.current.stateNameSchema(toString());
  }
}
