import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'visit_details_state.dart';

class VisitDetailsCubit extends Cubit<VisitDetailsState> {
  VisitDetailsCubit() : super(VisitDetailsInitial());
}
