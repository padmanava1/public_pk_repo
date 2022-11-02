
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup_ui/signup/domain/usecases/signup_usecase.dart';

import '../../../core/base/base_event.dart';
import '../../../core/base/base_state.dart';
import '../../data/model/signup_model.dart';
part 'sign_up_event.dart';


class SignUpBloc extends Bloc<SignUpEvent, BaseState> {
  SignUpUsecase signUpUsecase;

  SignUpBloc({required this.signUpUsecase}) : super(StateInitial()) {
    
    on<OnSelectCountryEvent>((event, emit) {
      event.isCountrySelected = !event.isCountrySelected;

      if (event.isCountrySelected == true) {
        emit(StateSearchResult(event.value));
      } else {
        emit(StateNoData());
      }
    });
    

    on<SignUpDataEvent>((event, emit) async{
      final res = await signUpUsecase.call(SignUpModel(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          phoneNumber: event.phoneNumber,
          password: event.password,
          
          gender: event.gender,
          
          
          countryCode: event.countryCode
          
    ));

      res.fold((l) {
        emit(StateErrorGeneral("Sign up is not possible"));
      }, (r) {print(res);
        emit(StateOnSuccess(res));
      });


    });


  }
}
