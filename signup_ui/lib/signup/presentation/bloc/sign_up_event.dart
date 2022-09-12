part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends BaseEvent{}


class OnSelectCountryEvent extends SignUpEvent {
  bool isCountrySelected;
  String value;
  OnSelectCountryEvent(this.isCountrySelected , this.value);
}


class SignUpDataEvent extends SignUpEvent{
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  
  String gender;
  
  
  String countryCode;
  

  SignUpDataEvent(
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password,
  
      this.gender,
  
  
      this.countryCode);
  

}