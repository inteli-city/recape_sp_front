import '../../../shared/domain/entities/obra_entity.dart';
import '../../../shared/helpers/errors/errors.dart';

abstract class UpdateObraState {}

class StartUpdateState implements UpdateObraState {
  const StartUpdateState();
}

class LoadingUpdateState implements UpdateObraState {
  const LoadingUpdateState();
}

class ErrorUpdateState implements UpdateObraState {
  final Failure error;
  const ErrorUpdateState(this.error);
}

class SuccessUpdateState implements UpdateObraState {
  final ObraEntity obra;
  const SuccessUpdateState(this.obra);
}
