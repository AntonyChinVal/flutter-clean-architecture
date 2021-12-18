import 'package:domain/model/generic_user.dart';
import 'package:flutter/material.dart';

class SessionProvider extends ChangeNotifier {
  GenericUser _user = GenericUser();

  saveUser(GenericUser user) {
    _user = user;
  }

  GenericUser get user => _user;
}
