import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/params.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/uri_repository.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';

abstract class SetParams {
  Either<Failure, Unit> call(Uri uri);
}

class SetParamsImpl implements SetParams {
  final UriRepository repository;

  SetParamsImpl(this.repository);
  @override
  Either<Failure, Unit> call(Uri uri) {
    final params = Params.fromQueryParams(uri.queryParameters);

    if (!params.isValidParams) {
      return Left(InvalidParams());
    }
    repository.setParamsFromUri(params);
    return const Right(unit);
  }
}
