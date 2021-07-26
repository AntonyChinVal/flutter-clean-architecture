import 'package:domain/model/generic_user/generic_user.dart';
import 'package:flutter/material.dart';

class SessionProvder extends ChangeNotifier {
  GenericUser? user;

  saveUser(GenericUser user) {
    this.user = user;
  }
}
