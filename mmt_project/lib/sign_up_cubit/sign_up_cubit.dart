import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:email_validator/email_validator.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

void signUpCubit(String fullName, String email, String password, String confirmPassword, ){
  if(fullName.isEmpty || fullName == null){
    emit(SignUpError('Enter your Full Name'));
  }

  else if(fullName.contains(RegExp(r'[0-9]'))  ){
    emit(SignUpError('Enter your name properly, numbers not allowed '));
  }

  else if(email.isEmpty || EmailValidator.validate(email) == false){
    emit(SignUpError('Enter your email in valid format'));
  }

  else if(password.isEmpty || password.length<8 || password.length >8){
    emit(SignUpError('Enter your password in 8 digits'));
  }

  else if(password != confirmPassword){
    emit(SignUpError("Your password doesn't match " ));
  }

  else {
    emit(SignUpSuccess());
  }
}
}
