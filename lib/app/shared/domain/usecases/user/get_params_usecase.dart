import 'package:dartz/dartz.dart';
import 'package:recape_sp_front/app/shared/domain/entities/params.dart';
import 'package:recape_sp_front/app/shared/domain/repositories/uri_repository.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';

abstract class GetParams {
  Either<Failure, Params> call();
}

class GetParamsImpl implements GetParams {
  final UriRepository repository;

  GetParamsImpl(this.repository);
  @override
  Either<Failure, Params> call() {
    final params = repository.getParams();
    if (!params.isValidParams) {
      return Left(InvalidParams());
    }
    return Right(params);
  }
}
