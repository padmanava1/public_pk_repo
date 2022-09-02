import 'package:equatable/equatable.dart';

class SignupModel extends Equatable {
  final String? firstName, lastName, email, phoneNumber, password, gender;

  const SignupModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.gender});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(

        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],
        gender: json['gender'],


    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "gender": gender,

    };
  }

  @override
  List<Object?> get props => [firstName, lastName, email, phoneNumber, password, gender];
}
