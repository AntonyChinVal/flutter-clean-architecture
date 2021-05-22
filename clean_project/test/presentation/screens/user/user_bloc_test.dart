import 'package:bloc_test/bloc_test.dart';
import 'package:clean_project/src/presentation/screens/user/bloc/UserBloc.dart';
import 'package:clean_project/src/presentation/screens/user/bloc/UserEvent.dart';
import 'package:clean_project/src/presentation/screens/user/bloc/UserState.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  userBlocTest();
}

void userBlocTest() {
  group('UserBloc', () {
    late UserBloc userBloc;

    setUp(() {
      userBloc = UserBloc();
    });

    test('Initial User Bloc', () {
      expect(userBloc.state, UserInitState());
    });

    blocTest(
      'User default',
      build: () => userBloc,
      act: (UserBloc bloc) => bloc.add(UserDefaultEvent()),
      expect: () => [],
    );
  });
}
