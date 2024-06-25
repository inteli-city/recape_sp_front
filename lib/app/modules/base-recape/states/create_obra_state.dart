import '../../../shared/domain/entities/obra_entity.dart';
import '../../../shared/helpers/errors/errors.dart';

abstract class CreateObraState {}

class StartCreateState implements CreateObraState {
  const StartCreateState();
}

class LoadingCreateState implements CreateObraState {
  const LoadingCreateState();
}

class ErrorCreateState implements CreateObraState {
  final Failure error;
  const ErrorCreateState(this.error);
}

class SuccessCreateState implements CreateObraState {
  final ObraEntity obra;
  const SuccessCreateState(this.obra);
}
