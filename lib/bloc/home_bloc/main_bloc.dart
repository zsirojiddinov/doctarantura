import 'dart:async';
import 'dart:convert';

import 'package:doctarantura/controller/generate_word_model_controller.dart';
import 'package:doctarantura/default/default_text.dart';
import 'package:doctarantura/models/word_model.dart';
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
    on<MatModelEvent>(matModel);
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

  FutureOr<void> matModel(MatModelEvent event, Emitter<MainState> emit) {
    var controller = GenerateWordModelController();
    var generate = controller.generate(otAfiksatsiya);
    print(json.encode(generate));
    myText = json.encode(generate);
    emit(SuccesState());
    var generate2 = controller.generate(otKompozitsiya);
    print(json.encode(generate2));
  }
}
