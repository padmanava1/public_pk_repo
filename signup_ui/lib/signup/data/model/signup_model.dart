


class SignUpModel

{
  final String?
      firstName,
      lastName,
      email,
      phoneNumber,
      password,
  
      gender,
  
  
      countryCode
  
  ;

  const SignUpModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password,
  
      required this.gender,
  
  
      required this.countryCode
  
      });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(

        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],

        gender: json['gender'],


        countryCode: json['countryCode'],


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
      
    
      "countryCode": countryCode,
    
    };
  }


}
