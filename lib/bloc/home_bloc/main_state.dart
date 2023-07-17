import 'package:flutter/widgets.dart';

@immutable
abstract class MainState {}

class SuccesState extends MainState {}

class ProgresState extends MainState {}

class ErrorState extends MainState {
  String message;

  ErrorState(this.message);
}


