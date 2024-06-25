import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/generated/l10n.dart';
import 'package:logger/logger.dart';

class Failure implements Exception {
  String errorMessage;

  Failure({
    required this.errorMessage,
    StackTrace? stackTrace,
  }) {
    Modular.get<Logger>().e(
      errorMessage,
      time: DateTime.now(),
      error: this,
      stackTrace: stackTrace,
    );
  }
}

class InvalidParams extends Failure {
  InvalidParams()
      : super(
          errorMessage: 'id_token',
          stackTrace: StackTrace.current,
        );
}

class NoInternetConnection extends Failure {
  NoInternetConnection()
      : super(errorMessage: S.current.noInternetConnectionErrorMessage);
}

class NoDataFound extends Failure {
  NoDataFound() : super(errorMessage: S.current.noDataFoundError);
}

class UnknownError extends Failure {
  final StackTrace? stackTrace;

  UnknownError({
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: S.current.unknownError,
        );
}

class LoginError extends Failure {
  LoginError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class GetAllObrasError extends Failure {
  GetAllObrasError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class CreateObraError extends Failure {
  CreateObraError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class DeleteObraError extends Failure {
  DeleteObraError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class UpdateObraError extends Failure {
  UpdateObraError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class UpdateMotoverificacaoError extends Failure {
  UpdateMotoverificacaoError({
    required super.stackTrace,
    required super.errorMessage,
  });
}
