import 'package:domain/model/generic_user/generic_user.dart';
import 'package:flutter/material.dart';

class SessionProvder extends ChangeNotifier {
  GenericUser _user = GenericUser();

  saveUser(GenericUser user) {
    this._user = user;
  }

  GenericUser get user => this._user;
}
