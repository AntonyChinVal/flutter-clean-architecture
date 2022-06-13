import 'package:domain/entity/user_entity.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../app.dart';

final sessionProvider = ChangeNotifierProvider(
    (ref) => SessionNotifier(userRepository: getIt<UserRepository>()));

class SessionNotifier extends ChangeNotifier {
  UserRepository? _userRepository;
  SessionUser _user = SessionUser();

  SessionNotifier({UserRepository? userRepository}) {
    _userRepository = userRepository;
  }

  Future authenticate(
      {required String username, required String password}) async {
    if (_userRepository != null) {
      try {
        await _userRepository!
            .authenticate(username: username, password: password);
        SessionUser user = await _userRepository!.getSessionUser();
        _user = user;
      } catch (error) {
        _user = SessionUser();
      }
    }
  }

  SessionUser get user => _user;
}
