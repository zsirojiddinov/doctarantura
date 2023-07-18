import 'package:flutter/widgets.dart';

@immutable
abstract class ActionState {}

class SuccesState extends ActionState {}

class ProgresState extends ActionState {}

class ErrorState extends ActionState {
  String message;

  ErrorState(this.message);
}


