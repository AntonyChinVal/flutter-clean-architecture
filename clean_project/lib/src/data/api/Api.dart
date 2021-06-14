import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

var dioOptions = BaseOptions(baseUrl: 'https://demo4566296.mockable.io/');

Dio dioApi = Dio(dioOptions);
Dio dioApiAuth = Dio(dioOptions);

void addAuthInterceptor() {
  dioApiAuth.interceptors
      .add(InterceptorsWrapper(onRequest: (options, handler) {
    dioApiAuth.interceptors.requestLock.lock();
    handler.next(options);
    dioApiAuth.interceptors.requestLock.unlock();
    //   options.headers['token'] = value;
    //   handler.next(options);
    // }).catchError((error, stackTrace) {
    //   handler.reject(error, true);
    // }).whenComplete(() => dioApiAuth.interceptors.requestLock.unlock());
  }));
}

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!;
  return token;
}
