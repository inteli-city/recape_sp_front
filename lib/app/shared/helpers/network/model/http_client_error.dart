import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';
import 'package:recape_sp_front/generated/l10n.dart';

class HttpClientError extends Failure {
  HttpClientError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}

class TimeOutError extends Failure {
  TimeOutError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}
