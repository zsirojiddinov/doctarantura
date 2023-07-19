import 'package:flutter/widgets.dart';

@immutable
abstract class MainEvent {}

class StartEvent extends MainEvent {
  String code;

  StartEvent(this.code);
}

class AllEvent extends MainEvent {}

class MatModelEvent extends MainEvent {}
