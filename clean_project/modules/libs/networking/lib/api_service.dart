import 'package:dio/dio.dart';
import 'package:local_storage/local_storage.dart';

var dioOptions = BaseOptions(baseUrl: 'https://demo4566296.mockable.io/');
Dio dioApi = Dio(dioOptions);

abstract class ApiService {
  Future<void> addAuthInterceptor();
  Future<T> post<T>(String path, {dynamic data});
  Future<T> get<T>(String path);
}

class ApiServiceImpl extends ApiService {
  Dio _dio;
  LocalStorageService _localStorageService;

  ApiServiceImpl(this._dio, this._localStorageService);

  @override
  Future<T> get<T>(String path) {
    return this._dio.get<T>(path).then((response) {
      print(response.data);
      return response.data!;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<T> post<T>(String path, {dynamic data}) {
    return this._dio.post<T>(path, data: data).then((response) {
      print(response.data);
      return response.data!;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<void> addAuthInterceptor() async {
    this
        ._dio
        .interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      this._dio.interceptors.requestLock.lock();
      _getToken().then((value) {
        options.headers['token'] = value;
        handler.next(options);
      }).whenComplete(() {
        this._dio.interceptors.requestLock.unlock();
      });
    }));
  }

  Future<String> _getToken() async {
    return this._localStorageService.getValue(key: "token");
  }
}
