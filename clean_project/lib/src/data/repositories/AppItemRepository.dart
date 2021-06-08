import 'package:clean_project/src/data/api/Api.dart';
import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/domain/repositories/AppItemRepository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppItemRepository)
class AppItemRepositoryImpl implements AppItemRepository {
  Dio? _dioApiAuth;

  AppItemRepositoryImpl.test(Dio dioApi) {
    this._dioApiAuth = dioApi;
  }
  AppItemRepositoryImpl() {
    this._dioApiAuth = dioApiAuth;
  }

  @override
  Future<List<AppItem>> getAppItems() {
    return _dioApiAuth!.get<List>("field/list").then((response) {
      List<AppItem>? list = response.data!
          .map((e) => AppItem.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    }).catchError((error) {
      throw error;
    });
  }
}
