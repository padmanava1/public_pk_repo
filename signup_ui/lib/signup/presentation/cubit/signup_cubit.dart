import 'package:bloc/bloc.dart';
import 'package:signup_ui/core/base/base_state.dart';


class SignupCubit extends Cubit<BaseState> {
  SignupCubit() : super(StateInitial());

  selectCountry(bool isCountrySelected,value){
    isCountrySelected = !isCountrySelected;
    if(isCountrySelected == true){
      emit(StateSearchResult(value));
    }
    else{
      emit(StateNoData());
    }
  }

}
