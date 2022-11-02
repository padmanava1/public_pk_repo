import 'package:bloc/bloc.dart';



class SignupCubit extends Cubit<BaseState> {

  SignUpUsecase signUpUsecase;
  
  SignupCubit({required this.signUpUsecase}) : super(StateInitial());


  
  selectCountry(bool isCountrySelected,value){
    isCountrySelected = !isCountrySelected;
    if(isCountrySelected == true){
      emit(StateSearchResult(value));
    }
    else{
      emit(StateNoData());
    }
  }
  


  signUpData(firstName,
      lastName,
      email,
      phoneNumber,
      password,
  
      gender,
  
  
      countryCode
  
  )
  {
    final res = signUpUsecase.call(SignupModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
  
        gender: gender,
  
  
        countryCode: countryCode
  
        ));
    if(res != null)
    emit(StateOnSuccess(res));
    else {
      emit(StateErrorGeneral("Sign up is not possible"));
    }
  }

  

}
