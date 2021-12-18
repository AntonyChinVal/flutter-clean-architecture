import 'package:dio/dio.dart';
import 'package:local_storage/local_storage.dart';

abstract class ApiService {
  Future<void> addAuthInterceptor();
  Future<T> post<T>(String path, {dynamic data});
  Future<T> get<T>(String path);
}

class ApiServiceImpl extends ApiService {
  final Dio _dio;
  final LocalStorageService _localStorageService;

  ApiServiceImpl(this._dio, this._localStorageService);

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
  Future<void> addAuthInterceptor() async {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      _dio.interceptors.requestLock.lock();
      _getToken().then((value) {
        options.headers['token'] = value;
        handler.next(options);
      }).whenComplete(() {
        _dio.interceptors.requestLock.unlock();
      });
    }));
  }

  Future<String> _getToken() async {
    return _localStorageService.getValue(key: "token");
  }
}
