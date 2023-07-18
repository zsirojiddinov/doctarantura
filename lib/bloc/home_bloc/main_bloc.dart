import 'dart:async';

import 'package:doctarantura/repository/kirish_tili_repository.dart';
import 'package:doctarantura/ui/home/action_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../service/file_service.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  String myText = "";

  MainBloc() : super(SuccesState()) {
    on<StartEvent>(start);
    on<AllEvent>(allAction);
  }

  FutureOr<void> start(StartEvent event, Emitter<MainState> emit) async {
    print("start");
    KirishTiliRepository repository = KirishTiliRepository(FileService());
    var model = await repository.getModel(event.code);
    myText = model.nameUz;
    print(model.nameUz);
    emit(SuccesState());
  }

  FutureOr<void> allAction(AllEvent event, Emitter<MainState> emit) {
    Get.to(ActionPage());
  }
}
