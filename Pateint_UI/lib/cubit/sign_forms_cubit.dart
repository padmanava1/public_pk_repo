import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:meta/meta.dart';

part 'sign_forms_state.dart';

enum groupvalues { Guardian, Patient }

class SignFormsCubit extends Cubit<SignFormsState> {
  SignFormsCubit() : super(SignFormInitial());

  String groupValue = groupvalues.Guardian.name;
  bool checkValue = false;

  setRadioValue(String val) {
    groupValue = val;
    updateUi();
  }

  setCheckBoxValue(bool val) {
    checkValue = val;
    updateUi();
  }

  void updateUi() {
    if (state is SignFormSuccess) {
      final success = state as SignFormSuccess;
      emit(success.copyWith(update: !success.updateFlag));
    } else {
      emit(SignFormSuccess(updateFlag: false));
    }
  }

  bool checkValidation(TextEditingController signature) {
    return checkValue && signature.text.trim().isNotEmpty ? true : false;
  }
}
