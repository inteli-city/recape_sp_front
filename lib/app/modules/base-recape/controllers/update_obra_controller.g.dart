// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_obra_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateObraController on UpdateObraControllerBase, Store {
  late final _$obraUpdatedAtom =
      Atom(name: 'UpdateObraControllerBase.obraUpdated', context: context);

  @override
  ObraEntity get obraUpdated {
    _$obraUpdatedAtom.reportRead();
    return super.obraUpdated;
  }

  @override
  set obraUpdated(ObraEntity value) {
    _$obraUpdatedAtom.reportWrite(value, super.obraUpdated, () {
      super.obraUpdated = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'UpdateObraControllerBase.state', context: context);

  @override
  UpdateObraState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UpdateObraState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$setImageAsyncAction =
      AsyncAction('UpdateObraControllerBase.setImage', context: context);

  @override
  Future<void> setImage(XFile file) {
    return _$setImageAsyncAction.run(() => super.setImage(file));
  }

  late final _$updateObraAsyncAction =
      AsyncAction('UpdateObraControllerBase.updateObra', context: context);

  @override
  Future<void> updateObra() {
    return _$updateObraAsyncAction.run(() => super.updateObra());
  }

  late final _$deleteObraAsyncAction =
      AsyncAction('UpdateObraControllerBase.deleteObra', context: context);

  @override
  Future<void> deleteObra() {
    return _$deleteObraAsyncAction.run(() => super.deleteObra());
  }

  late final _$approveObraAsyncAction =
      AsyncAction('UpdateObraControllerBase.approveObra', context: context);

  @override
  Future<void> approveObra() {
    return _$approveObraAsyncAction.run(() => super.approveObra());
  }

  late final _$UpdateObraControllerBaseActionController =
      ActionController(name: 'UpdateObraControllerBase', context: context);

  @override
  void changeState(UpdateObraState value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFonte(FonteEnum? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setFonte');
    try {
      return super.setFonte(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateFonte(FonteEnum? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateFonte');
    try {
      return super.validateFonte(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(StatusObraEnum? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateStatus(StatusObraEnum? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateStatus');
    try {
      return super.validateStatus(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVia(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setVia');
    try {
      return super.setVia(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateVia(String? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateVia');
    try {
      return super.validateVia(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDe(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setDe');
    try {
      return super.setDe(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateDe(String? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateDe');
    try {
      return super.validateDe(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAte(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setAte');
    try {
      return super.setAte(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateAte(String? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateAte');
    try {
      return super.validateAte(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setViaPadrao(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setViaPadrao');
    try {
      return super.setViaPadrao(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateViaPadrao(String? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateViaPadrao');
    try {
      return super.validateViaPadrao(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setViaComplemento(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setViaComplemento');
    try {
      return super.setViaComplemento(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubprefeitura(SubprefeituraEnum? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setSubprefeitura');
    try {
      return super.setSubprefeitura(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateSubprefeitura(SubprefeituraEnum? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateSubprefeitura');
    try {
      return super.validateSubprefeitura(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExtensao(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setExtensao');
    try {
      return super.setExtensao(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArea(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setArea');
    try {
      return super.setArea(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataTermino(String? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setDataTermino');
    try {
      return super.setDataTermino(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateDataTermino(String? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateDataTermino');
    try {
      return super.validateDataTermino(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRevestimento(RevestimentoEnum? value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setRevestimento');
    try {
      return super.setRevestimento(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComentarios(String value) {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.setComentarios');
    try {
      return super.setComentarios(value);
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateAddressChange() {
    final _$actionInfo = _$UpdateObraControllerBaseActionController.startAction(
        name: 'UpdateObraControllerBase.validateAddressChange');
    try {
      return super.validateAddressChange();
    } finally {
      _$UpdateObraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obraUpdated: ${obraUpdated},
state: ${state}
    ''';
  }
}
