import 'package:dio/dio.dart' hide ProgressCallback;
import 'package:recape_sp_front/app/shared/helpers/network/http_clients/http_client.dart';
import 'package:recape_sp_front/app/shared/helpers/network/model/http_client_error.dart';
import '../model/http_client_request_params.dart';
import '../model/http_client_response.dart';
import '../model/http_request_methods_enum.dart';

class DioHttpClient extends IHttpClient {
  final String baseApiUrl;
  final List<Interceptor> interceptors;
  late final Dio _dio;
  DioHttpClient({
    required this.baseApiUrl,
    Map<String, dynamic> headers = const {},
    this.interceptors = const [],
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseApiUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    _dio.options.headers.addAll(headers);

    _dio.interceptors.addAll([...interceptors]);
  }

  Future<HttpClientResponse> request(HttpClientRequestParams params) async {
    try {
      final response = await _dio.request(
        params.endPoint,
        data: params.body,
        queryParameters: params.queryParams,
        options: Options(method: params.method.name, headers: params.headers),
        onReceiveProgress: params.onReceiveProgress,
        onSendProgress: params.onSendProgress,
      );

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.receiveTimeout) {
        throw TimeOutError(error.message, stackTrace: error.stackTrace);
      }
      // Caso o front lide com as mensagens de erro:
      // HttpStatusCodeEnum errorType = getHttpStatusFunction(
      //     e.response?.statusCode ?? HttpStatus.badRequest);
      // Caso a mensagem de erro venha da API:
      throw HttpClientError(error.response!.data, stackTrace: error.stackTrace);
    }
  }

  @override
  Future<HttpClientResponse> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.get,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }

  @override
  Future<HttpClientResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.post,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }

  @override
  Future<HttpClientResponse> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.delete,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }

  @override
  Future<HttpClientResponse> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return request(
      HttpClientRequestParams(
        endPoint: path,
        method: HttpRequestMethodsEnum.put,
        body: data,
        queryParams: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      ),
    );
  }
}
