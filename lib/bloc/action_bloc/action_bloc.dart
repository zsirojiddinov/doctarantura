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
    on<AllEvent>(all);
  }

  FutureOr<void> all(AllEvent event, Emitter<ActionState> emit) async {
    KirishTiliRepository repository = KirishTiliRepository(FileService());
    listKirishTili = await repository.getKirishList();
    emit(SuccesState());
  }
}
