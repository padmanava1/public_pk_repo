import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'visits_state.dart';

class VisitsCubit extends Cubit<VisitsState> {
  VisitsCubit() : super(VisitsInitial());

  bool isListTileExpanded = false;

  listTileArrowTapped(bool value, int index){
    if(isListTileExpanded == false){
      emit(ListTileUnExpandedState(value, index));
    }
    else emit(ListTileExpandedState(value, index));
  }
}
