// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_fiscalizacao_convias_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MultipleFiscalizacaoConviasController
    on MultipleFiscalizacaoConviasControllerBase, Store {
  late final _$motoverificacaoAtom = Atom(
      name: 'MultipleFiscalizacaoConviasControllerBase.motoverificacao',
      context: context);

  @override
  MotoverificacaoEntity get motoverificacao {
    _$motoverificacaoAtom.reportRead();
    return super.motoverificacao;
  }

  @override
  set motoverificacao(MotoverificacaoEntity value) {
    _$motoverificacaoAtom.reportWrite(value, super.motoverificacao, () {
      super.motoverificacao = value;
    });
  }

  late final _$stateAtom = Atom(
      name: 'MultipleFiscalizacaoConviasControllerBase.state',
      context: context);

  @override
  UpdateMotoverificacaoState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UpdateMotoverificacaoState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$updateMotoverificacaoAsyncAction = AsyncAction(
      'MultipleFiscalizacaoConviasControllerBase.updateMotoverificacao',
      context: context);

  @override
  Future<void> updateMotoverificacao() {
    return _$updateMotoverificacaoAsyncAction
        .run(() => super.updateMotoverificacao());
  }

  late final _$updateMotoverificacaoIntelicityAsyncAction = AsyncAction(
      'MultipleFiscalizacaoConviasControllerBase.updateMotoverificacaoIntelicity',
      context: context);

  @override
  Future<void> updateMotoverificacaoIntelicity() {
    return _$updateMotoverificacaoIntelicityAsyncAction
        .run(() => super.updateMotoverificacaoIntelicity());
  }

  late final _$updateMotoverificacaoConviasAsyncAction = AsyncAction(
      'MultipleFiscalizacaoConviasControllerBase.updateMotoverificacaoConvias',
      context: context);

  @override
  Future<void> updateMotoverificacaoConvias() {
    return _$updateMotoverificacaoConviasAsyncAction
        .run(() => super.updateMotoverificacaoConvias());
  }

  late final _$MultipleFiscalizacaoConviasControllerBaseActionController =
      ActionController(
          name: 'MultipleFiscalizacaoConviasControllerBase', context: context);

  @override
  void changeState(UpdateMotoverificacaoState value) {
    final _$actionInfo =
        _$MultipleFiscalizacaoConviasControllerBaseActionController.startAction(
            name: 'MultipleFiscalizacaoConviasControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$MultipleFiscalizacaoConviasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMotoverificacaoConvias(bool? value) {
    final _$actionInfo =
        _$MultipleFiscalizacaoConviasControllerBaseActionController.startAction(
            name:
                'MultipleFiscalizacaoConviasControllerBase.setMotoverificacaoConvias');
    try {
      return super.setMotoverificacaoConvias(value);
    } finally {
      _$MultipleFiscalizacaoConviasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMotoverificacaoIntelicity(bool? value) {
    final _$actionInfo =
        _$MultipleFiscalizacaoConviasControllerBaseActionController.startAction(
            name:
                'MultipleFiscalizacaoConviasControllerBase.setMotoverificacaoIntelicity');
    try {
      return super.setMotoverificacaoIntelicity(value);
    } finally {
      _$MultipleFiscalizacaoConviasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setJustificativaIntelicity(String? value) {
    final _$actionInfo =
        _$MultipleFiscalizacaoConviasControllerBaseActionController.startAction(
            name:
                'MultipleFiscalizacaoConviasControllerBase.setJustificativaIntelicity');
    try {
      return super.setJustificativaIntelicity(value);
    } finally {
      _$MultipleFiscalizacaoConviasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String? validateJustificativaIntelicity(String? value) {
    final _$actionInfo =
        _$MultipleFiscalizacaoConviasControllerBaseActionController.startAction(
            name:
                'MultipleFiscalizacaoConviasControllerBase.validateJustificativaIntelicity');
    try {
      return super.validateJustificativaIntelicity(value);
    } finally {
      _$MultipleFiscalizacaoConviasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
motoverificacao: ${motoverificacao},
state: ${state}
    ''';
  }
}
