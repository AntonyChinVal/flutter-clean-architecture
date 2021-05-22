import 'package:clean_project/src/data/api/Api.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  Dio? _dioApi;

  AuthenticationRepositoryImpl.test(Dio dioApi) {
    this._dioApi = dioApi;
  }
  AuthenticationRepositoryImpl() {
    this._dioApi = dioApi;
  }

  @override
  Future<String> authenticate({String email = "", String password = ""}) {
    return _dioApi!
        .post<String>("authentication/authenticate")
        .then((response) {
      print("Response authenticate");
      print(response);
      addAuthInterceptor();
      return response.data!;
    }).catchError((error) {
      throw error;
    });
  }
}
