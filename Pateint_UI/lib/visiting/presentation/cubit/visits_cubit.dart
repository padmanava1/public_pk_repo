import 'package:bloc/bloc.dart';

import 'package:pateint_ui/core/failures/failures.dart';
import 'package:pateint_ui/core/usecases/usecase.dart';
import 'package:pateint_ui/visiting/presentation/cubit/visits_state.dart';

import '../../domain/use_cases/all_visits_usecase.dart';

class VisitsCubit extends Cubit<VisitsState> {
  bool isListTileExpanded = false;
  AllVisitsUsecase allVisitsUsecase;
  VisitsCubit({required this.allVisitsUsecase}) : super(VisitsInitial());

  listTileArrowTapped(bool value, int index) {
    isListTileExpanded = value;
    emit(ListTileExpandedState(isListTileExpanded, index));
  }

  // showAllVisits() async {
  //   var res = await allVisitsUsecase.call(NoParams());
  //
  //   res.fold((l) => ServerFailure(),
  //       (r) => emit(StateOnSuccess(r)));
  // }

  showAllVisits() async {
    var res = await allVisitsUsecase.call(NoParams());

    res.fold((l) => ServerFailure(),
            (r) => emit(AllVisitsSuccessState(allVisitsList: r)));
  }
}
