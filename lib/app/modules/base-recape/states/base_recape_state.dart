import 'package:recape_sp_front/app/shared/domain/entities/obra_entity.dart';

import '../../../shared/helpers/errors/errors.dart';

abstract class BaseRecapeState {
  const BaseRecapeState();
}

class BaseRecapeInitialState extends BaseRecapeState {}

class BaseRecapeLoadingState extends BaseRecapeState {}

class BaseRecapeLoadedSuccessState extends BaseRecapeState {
  final List<ObraEntity> listObras;

  const BaseRecapeLoadedSuccessState({required this.listObras});
}

class BaseRecapeErrorState extends BaseRecapeState {
  final Failure error;

  const BaseRecapeErrorState({required this.error});
}
