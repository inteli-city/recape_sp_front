import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recape_sp_front/app/modules/user/stores/user_store.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final UserStore userStore = Modular.get();
    if (userStore.user == null) {
      options.headers['Authorization'] = 'Bearer ${userStore.params!.idToken}';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // (err.response?.statusCode == 401 || err.response?.statusCode == 403)
    //     ? Modular.to.navigate('/')
    //     : null;
    return handler.next(err);
  }
}
