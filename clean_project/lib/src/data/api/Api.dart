import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

var options = BaseOptions(
  baseUrl: 'https://demo4566296.mockable.io/'
);

Dio dioApi = Dio(options);
Dio dioApiAuth = Dio(options);

void addAuthInterceptor(){

  dioApiAuth.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler){
      
      dioApiAuth.interceptors.requestLock.lock();
      getToken()
      .then((value){
        options.headers['token'] = value;
        print("Options");
        print(options);
        handler.next(options);
      })
      .catchError((error, stackTrace) {
       handler.reject(error, true);
    }).whenComplete(() => dioApiAuth.interceptors.requestLock.unlock());
    }
  ));

}

Future<String> getToken() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!;
  print("Token from Shared");
  print(token);
  return token;

}