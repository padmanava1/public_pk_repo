import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upcoming_visit_page_state.dart';

class UpcomingVisitPageCubit extends Cubit<UpcomingVisitPageState> {
  UpcomingVisitPageCubit() : super(UpcomingVisitPageInitial());

  bool isExpanded = false;

  arrowTapped(bool value,){
    if(isExpanded == false){
      emit(UnExpandedState(value));
    }
    else emit(ExpandedState(value));
  }
}
