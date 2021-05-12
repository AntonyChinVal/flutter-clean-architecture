import 'dart:async';
import 'package:flutter/foundation.dart';

abstract class UseCase<T, Params> {

  @mustCallSuper
  UseCase();

  Future<T> execute(Params params);

}

abstract class UseCaseN<T> {

  @mustCallSuper
  UseCaseN();

  Future<T> execute();
  
}