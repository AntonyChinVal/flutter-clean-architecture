import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/repositories/FieldRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : FieldRepository)
class FieldRepositoryImpl implements FieldRepository{


  @override
  Future<List<Field>> getFields() {

    return http.get(Uri.https("demo4566296.mockable.io", "field/list"))
    .then((response){
        stdout.write("Response");
        stdout.write(response);
        List postList = (json.decode(response.body) as List);
        List<Field>? list = postList.map((e) => Field.fromJson(e as Map<String, dynamic>)).toList();
        return list;
      })
      .catchError((error){
          stderr.write("ERROR");
          stderr.write(error);
      });
      
    }

}