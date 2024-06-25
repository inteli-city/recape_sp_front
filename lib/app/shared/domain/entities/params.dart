class Params {
  final String? idToken;

  Params._({required this.idToken});

  bool get isValidParams => _isValidIdToken;
  bool get _isValidIdToken => (idToken?.isNotEmpty ?? false);

  String get paramsRequiredMessage =>
      [!_isValidIdToken ? 'id_token' : null].whereType<String>().join(', ');

  factory Params.fromQueryParams(Map<String, String> queryParams) {
    return Params._(idToken: queryParams['id_token']);
  }
  factory Params.initial() {
    return Params._(idToken: '');
  }

  Params copyWith({
    String? idToken,
  }) {
    return Params._(
      idToken: idToken ?? this.idToken,
    );
  }
}
