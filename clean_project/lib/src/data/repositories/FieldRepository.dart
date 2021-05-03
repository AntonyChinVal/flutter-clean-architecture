import 'package:clean_project/src/data/api/Api.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/repositories/FieldRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : FieldRepository)
class FieldRepositoryImpl implements FieldRepository{


  @override
  Future<List<Field>> getFields() {
    return dioApiAuth.get<List>("field/list")
    .then((response){
        List<Field>? list = response.data!.map((e) => Field.fromJson(e as Map<String, dynamic>)).toList();
        return list;
      })
      .catchError((error){
          print("ERROR");
          print(error);
      });
      
    }

}