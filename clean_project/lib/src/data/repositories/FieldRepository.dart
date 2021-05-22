import 'package:clean_project/src/data/api/Api.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/repositories/FieldRepository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FieldRepository)
class FieldRepositoryImpl implements FieldRepository {
  Dio? _dioApiAuth;

  FieldRepositoryImpl.test(Dio dioApi) {
    this._dioApiAuth = dioApi;
  }
  FieldRepositoryImpl() {
    this._dioApiAuth = dioApiAuth;
  }

  @override
  Future<List<Field>> getFields() {
    return _dioApiAuth!.get<List>("field/list").then((response) {
      List<Field>? list = response.data!
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    }).catchError((error) {
      throw error;
    });
  }
}
