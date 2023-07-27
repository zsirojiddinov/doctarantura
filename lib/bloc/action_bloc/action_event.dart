import 'package:flutter/widgets.dart';

@immutable
abstract class ActionEvent {}

class SetDefaultEvent extends ActionEvent {}

class OtAfiksatsiyaEvent extends ActionEvent {}

class OtKompozitsiyaEvent extends ActionEvent {}

class KirishTiliEvent extends ActionEvent {}

class AddKirishTiliEvent extends ActionEvent {
  String code;
  String nameUz;
  String nameRu;

  AddKirishTiliEvent(this.code, this.nameUz, this.nameRu);
}
