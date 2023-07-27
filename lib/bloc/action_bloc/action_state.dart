import 'package:flutter/widgets.dart';

@immutable
abstract class ActionState {}

class SuccesState extends ActionState {}

class ProgresState extends ActionState {}

class OtAfiksatsiyaState extends ActionState {}

class OtKompozitsiyaState extends ActionState {}

class KirishTiliState extends ActionState {}

class ErrorState extends ActionState {
  String message;

  ErrorState(this.message);
}
