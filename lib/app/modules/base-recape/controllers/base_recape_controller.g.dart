// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_recape_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseRecapeController on BaseRecapeControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'BaseRecapeControllerBase.state', context: context);

  @override
  BaseRecapeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(BaseRecapeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$obrasAtom =
      Atom(name: 'BaseRecapeControllerBase.obras', context: context);

  @override
  List<ObraEntity> get obras {
    _$obrasAtom.reportRead();
    return super.obras;
  }

  @override
  set obras(List<ObraEntity> value) {
    _$obrasAtom.reportWrite(value, super.obras, () {
      super.obras = value;
    });
  }

  late final _$getAllObrasAsyncAction =
      AsyncAction('BaseRecapeControllerBase.getAllObras', context: context);

  @override
  Future<void> getAllObras() {
    return _$getAllObrasAsyncAction.run(() => super.getAllObras());
  }

  late final _$createAndExportXlsFileAsyncAction = AsyncAction(
      'BaseRecapeControllerBase.createAndExportXlsFile',
      context: context);

  @override
  Future<void> createAndExportXlsFile() {
    return _$createAndExportXlsFileAsyncAction
        .run(() => super.createAndExportXlsFile());
  }

  late final _$BaseRecapeControllerBaseActionController =
      ActionController(name: 'BaseRecapeControllerBase', context: context);

  @override
  void changeState(BaseRecapeState value) {
    final _$actionInfo = _$BaseRecapeControllerBaseActionController.startAction(
        name: 'BaseRecapeControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$BaseRecapeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filter(
      {String? filterVia,
      SubprefeituraEnum? filterSubprefeitura,
      DateTimeRange? filterDataTermino,
      FonteEnum? filterFonte,
      StatusObraEnum? filterStatusObra,
      String? filterId,
      StatusGeometriaEnum? filterStatusGeometria,
      String? filterLogradouro,
      bool? filterMotoverficacaoConvias,
      bool? filterMotoverficacaoIntelicity,
      DateTimeRange? filterDataConvias}) {
    final _$actionInfo = _$BaseRecapeControllerBaseActionController.startAction(
        name: 'BaseRecapeControllerBase.filter');
    try {
      return super.filter(
          filterVia: filterVia,
          filterSubprefeitura: filterSubprefeitura,
          filterDataTermino: filterDataTermino,
          filterFonte: filterFonte,
          filterStatusObra: filterStatusObra,
          filterId: filterId,
          filterStatusGeometria: filterStatusGeometria,
          filterLogradouro: filterLogradouro,
          filterMotoverficacaoConvias: filterMotoverficacaoConvias,
          filterMotoverficacaoIntelicity: filterMotoverficacaoIntelicity,
          filterDataConvias: filterDataConvias);
    } finally {
      _$BaseRecapeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
obras: ${obras}
    ''';
  }
}
