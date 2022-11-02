
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'questionare_state.dart';

enum question1 {Yes, No}
enum question2 {Mother, Father, Both_Parents, Patient, Others}


class QuestionareCubit extends Cubit<QuestionareState> {
  QuestionareCubit() : super(QuestionareInitial());

  String groupValue1 = "Yes";
  String groupValue2 = "Mother";
  String dropdownvalue1 = 'Answer';
  String dropdownvalue2 = "Answer";
  String dropdownvalue3 = "Date";

  setYesNoRadioValue(String val) {
    groupValue1 = val;
    updateUi();
  }

  setWhoFilledOutRadioValue(String val){
    groupValue2 = val;
    updateUi();
  }


  setDropDownValue1(String val){
    dropdownvalue1 = val;
    updateUi();
  }

  setDropDownValue2(String val){
    dropdownvalue2 = val;
    updateUi();
  }

  setDropDownValue3(String val){
    dropdownvalue3 = val;
    updateUi();
  }

  // setWhoFilledRadioValue(String val) {
  //   groupValue2 = val;
  //   updateUi();
  // }

  void updateUi() {
    if (state is QuestionareFormSuccess) {
      final success = state as QuestionareFormSuccess;
      emit(success.copyWith(update: !success.updateFlag));
    } else {
      emit(QuestionareFormSuccess(updateFlag: false));
    }
  }
}