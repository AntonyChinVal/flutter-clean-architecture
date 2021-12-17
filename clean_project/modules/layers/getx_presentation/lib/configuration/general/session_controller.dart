import 'package:domain/model/generic_user.dart';
import 'package:get/get.dart';

class SessionController extends GetxController {
  var user = GenericUser().obs;

  saveUser(GenericUser user) {
    this.user.value = user;
  }
}
