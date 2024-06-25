import '../../../shared/domain/entities/obra_entity.dart';
import '../../../shared/helpers/errors/errors.dart';

abstract class UpdateMotoverificacaoState {}

class StartUpdateMotoverificacaoState implements UpdateMotoverificacaoState {
  const StartUpdateMotoverificacaoState();
}

class LoadingUpdateMotoverificacaoState implements UpdateMotoverificacaoState {
  const LoadingUpdateMotoverificacaoState();
}

class ErrorUpdateMotoverificacaoState implements UpdateMotoverificacaoState {
  final Failure error;
  const ErrorUpdateMotoverificacaoState(this.error);
}

class SuccessUpdateMotoverificacaoState implements UpdateMotoverificacaoState {
  final List<ObraEntity> obra;
  const SuccessUpdateMotoverificacaoState(this.obra);
}
