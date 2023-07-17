import 'dart:async';

import 'package:doctarantura/utils/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/file_repository.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(SuccesState()) {
    on<StartEvent>(start);
  }

  FutureOr<void> start(StartEvent event, Emitter<MainState> emit) async {
    print("start");
    var repository = FileRepository();
    var txt = await repository.readCounter(Resource.FILE_OT_SOZ_TURKUMI);
   // print(txt);
    repository.writeCounter(Resource.FILE_OT_SOZ_TURKUMI, "$txt+");
    txt = await repository.readCounter(Resource.FILE_OT_SOZ_TURKUMI);
    print(txt);
  }
}
