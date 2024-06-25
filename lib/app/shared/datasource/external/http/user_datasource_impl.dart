import 'package:recape_sp_front/app/shared/domain/entities/user_entity.dart';
import 'package:recape_sp_front/app/shared/helpers/errors/errors.dart';
import 'package:recape_sp_front/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:recape_sp_front/app/shared/helpers/network/model/http_client_error.dart';
import 'package:recape_sp_front/app/shared/infra/adapters/user_adapter.dart';
import 'package:recape_sp_front/app/shared/infra/external/http/user_datasource.dart';

class UserDatasourceImpl implements IUserDatasource {
  final IHttpClient _httpClient;

  UserDatasourceImpl(this._httpClient);
  @override
  Future<UserEntity> loginUser() async {
    try {
      final response = await _httpClient.post('/login-user');

      return UserAdapter.fromJson(response.data['user']);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnection();
      } else {
        throw LoginError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }
}
