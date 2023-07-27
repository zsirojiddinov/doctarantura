import 'dart:async';

import 'package:doctarantura/models/kengayuvchi_kirish_tili.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/kirish_tili_repository.dart';
import '../../service/file_service.dart';
import 'action_event.dart';
import 'action_state.dart';

class ActionBloc extends Bloc<ActionEvent, ActionState> {
  var listKirishTili = <KirishTili>[];

  ActionBloc() : super(SuccesState()) {
    on<SetDefaultEvent>(setDefault);
    on<OtAfiksatsiyaEvent>(otAfiksatsi);
    on<OtKompozitsiyaEvent>(otKompozitsi);
    on<KirishTiliEvent>(kirishTili);
    on<AddKirishTiliEvent>(addKirishTili);
  }

  FutureOr<void> setDefault(
      SetDefaultEvent event, Emitter<ActionState> emit) async {
    print("set default");
    KirishTiliRepository repository = KirishTiliRepository(FileService());
    listKirishTili = await repository.setDefault();
    emit(SuccesState());
  }

  FutureOr<void> otAfiksatsi(
      OtAfiksatsiyaEvent event, Emitter<ActionState> emit) {
    emit(OtAfiksatsiyaState());
  }

  FutureOr<void> otKompozitsi(
      OtKompozitsiyaEvent event, Emitter<ActionState> emit) {
    emit(OtKompozitsiyaState());
  }

  FutureOr<void> kirishTili(
      KirishTiliEvent event, Emitter<ActionState> emit) async {
    KirishTiliRepository repository = KirishTiliRepository(FileService());
    listKirishTili = await repository.getKirishList();
    emit(KirishTiliState());
  }

  FutureOr<void> addKirishTili(
      AddKirishTiliEvent event, Emitter<ActionState> emit) async {
    KirishTiliRepository repository = KirishTiliRepository(FileService());
    listKirishTili = await repository.addKirishList(
      event.code,
      event.nameUz,
      event.nameRu,
    );
    emit(KirishTiliState());
  }
}
