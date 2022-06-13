import 'package:dio/dio.dart';
import 'package:local_storage/local_storage.dart';
import 'package:flutter/foundation.dart';

abstract class NetworkingService {
  Future<void> addGeneralInterceptor();
  Future<T?> post<T>(String path, {dynamic data});
  Future<T?> get<T>(String path);
}

class NetworkingServiceImpl extends NetworkingService {
  final Dio _dio;
  final LocalStorageService _localStorageService;

  NetworkingServiceImpl(this._dio, this._localStorageService);

  @override
  Future<T> get<T>(String path) {
    return _dio.get<T>(path).then((response) {
      return response.data!;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<T> post<T>(String path, {dynamic data}) {
    return _dio.post<T>(path, data: data).then((response) {
      return response.data!;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<void> addGeneralInterceptor() async {
    _dio.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      debugPrint("------ REQUEST URL: ${options.uri}");
      _getToken().then((value) {
        options.headers['Authorization'] = "Bearer $value";
        debugPrint("------ REQUEST HEADERS: ${options.headers}");
        debugPrint("------ REQUEST DATA: ${options.data}");
        handler.next(options);
      }).catchError((onError) {
        debugPrint("------ REQUEST HEADERS: ${options.headers}");
        debugPrint("------ REQUEST DATA: ${options.data}");
        handler.next(options);
      });
    }, onResponse: (response, handler) {
      debugPrint("------ RESPONSE: ${response.data}");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      debugPrint("------ ERROR: ${e.message}");
      return handler.next(e);
    }));
  }

  Future<String> _getToken() async {
    return _localStorageService.getValue(key: "token");
  }
}
