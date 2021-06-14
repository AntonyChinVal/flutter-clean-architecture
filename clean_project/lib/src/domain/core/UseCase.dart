import 'dart:async';
import 'package:flutter/foundation.dart';

abstract class UseCase<T, P> {
  @mustCallSuper
  UseCase();

  Future<T> execute(P params);
}

abstract class NoParamUseCase<T> {
  @mustCallSuper
  NoParamUseCase();

  Future<T> execute();
}
