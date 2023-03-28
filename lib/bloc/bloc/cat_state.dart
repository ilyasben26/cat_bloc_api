part of 'cat_bloc.dart';

abstract class CatState extends Equatable {
  const CatState();
}

class CatLoadingState extends CatState {
  @override
  List<Object> get props => [];
}

class CatLoadedState extends CatState {
  final String catFact;
  final int catLength;
  final String catPic;

  const CatLoadedState(this.catFact, this.catLength, this.catPic);

  @override
  List<Object?> get props => [catFact, catLength];
}

class CatFailedAPI extends CatState {
  @override
  List<Object> get props => [];
}
