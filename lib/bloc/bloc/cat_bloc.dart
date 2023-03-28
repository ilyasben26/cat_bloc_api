import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../services/cat_service.dart';

import 'package:equatable/equatable.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatService _catService;

  CatBloc(this._catService) : super(CatLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      emit(CatLoadingState());
      try {
        final catFact = await _catService.getCatFact();
        final catPic = await _catService.getCatPic();
        emit(CatLoadedState(catFact.fact, catFact.length, catPic.file));
      } catch (error) {
        log(error.toString());
        emit(CatFailedAPI());
      }
    });
  }
}
