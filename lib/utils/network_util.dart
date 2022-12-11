import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:studybuddy/utils/constants.dart';

class NetworkUtil {
  static NetworkUtil? _instance;
  static late Dio _dio;

  static NetworkUtil get instance {
    _instance ??= NetworkUtil._init();
    return _instance!;
  }

  NetworkUtil._init() {
    final BaseOptions options = BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response> get(String path, {String? accessToken}) async {
    attachAccessToken(accessToken);
    path += '?format=json';
    final Response response = await _dio.get(path);
    return response;
  }

  Future<Response> post(String path, {required Map<String, dynamic> data, String? accessToken}) async {
    attachAccessToken(accessToken);
    path += '?format=json';
    final Response response = await _dio.post(path, data: data);
    return response;
  }

  attachAccessToken(String? accessToken) {
    if (accessToken != null) {
      _dio.options.headers['Authorization'] = 'Token $accessToken';
    } else {
      _dio.options.headers['Authorization'] = null;
    }
  }
}
