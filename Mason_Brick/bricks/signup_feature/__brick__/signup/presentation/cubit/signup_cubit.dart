import 'package:bloc/bloc.dart';



class SignupCubit extends Cubit<BaseState> {

  SignUpUsecase signUpUsecase;
  
  SignupCubit({required this.signUpUsecase}) : super(StateInitial());


  {{#isCountryPicker}}
  selectCountry(bool isCountrySelected,value){
    isCountrySelected = !isCountrySelected;
    if(isCountrySelected == true){
      emit(StateSearchResult(value));
    }
    else{
      emit(StateNoData());
    }
  }
  {{/isCountryPicker}}


  signUpData(firstName,
      lastName,
      email,
      phoneNumber,
      password,
  {{#isGender}}
      gender,
  {{/isGender}}
  {{#isCountryPicker}}
      countryCode
  {{/isCountryPicker}}
  )
  {
    final res = signUpUsecase.call(SignupModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
  {{#isGender}}
        gender: gender,
  {{/isGender}}
  {{#isCountryPicker}}
        countryCode: countryCode
  {{/isCountryPicker}}
        ));
    if(res != null)
    emit(StateOnSuccess(res));
    else {
      emit(StateErrorGeneral("Sign up is not possible"));
    }
  }

  

}
