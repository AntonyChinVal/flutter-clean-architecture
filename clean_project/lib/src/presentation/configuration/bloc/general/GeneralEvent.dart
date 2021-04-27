import 'package:flutter/cupertino.dart';

abstract class GeneralEvent{}

class Loading extends GeneralEvent { 
  final BuildContext context;

  Loading( this.context);
}

class DissmissLoading extends GeneralEvent {
  final BuildContext context;

  DissmissLoading(this.context);
}