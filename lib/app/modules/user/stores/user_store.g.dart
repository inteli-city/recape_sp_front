// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: 'UserStoreBase.hasError'))
      .value;

  late final _$userAtom = Atom(name: 'UserStoreBase.user', context: context);

  @override
  UserEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$paramsAtom =
      Atom(name: 'UserStoreBase.params', context: context);

  @override
  Params? get params {
    _$paramsAtom.reportRead();
    return super.params;
  }

  @override
  set params(Params? value) {
    _$paramsAtom.reportWrite(value, super.params, () {
      super.params = value;
    });
  }

  late final _$errorAtom = Atom(name: 'UserStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  void checkParams() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.checkParams');
    try {
      return super.checkParams();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
params: ${params},
error: ${error},
hasError: ${hasError}
    ''';
  }
}
