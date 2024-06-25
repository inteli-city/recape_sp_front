import '../../../../generated/l10n.dart';
import '../../domain/enums/fonte_enum.dart';
import '../../domain/enums/status_obra_enum.dart';
import '../../domain/enums/subprefeitura_enum.dart';

class ValidationFieldHelper {
  static String? validateFonte(FonteEnum? value) {
    if (value == null) {
      return S.current.fieldRequired;
    }
    return null;
  }

  static String? validateSubprefeitura(SubprefeituraEnum? value) {
    if (value == null) {
      return S.current.fieldRequired;
    }
    return null;
  }

  static String? validateStatus(StatusObraEnum? value) {
    if (value == null) {
      return S.current.fieldRequired;
    }
    return null;
  }

  static String? validateFieldRequired(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    return null;
  }

  static String? validateDataTermino(String? value) {
    RegExp regex = RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$',
    );
    if (value == null ||
        value.length != 10 ||
        value.isEmpty ||
        !regex.hasMatch(value)) {
      return 'Digite uma data válida';
    }
    return null;
  }
}
