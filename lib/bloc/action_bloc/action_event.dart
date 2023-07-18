import 'package:flutter/widgets.dart';

@immutable
abstract class ActionEvent {}

class AllEvent extends ActionEvent {}

class SetDefault extends ActionEvent {}
