
class SignupModel
{{#isEquatable}}
    extends Equatable
{{/isEquatable}}
{
  final String?
      firstName,
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
  ;

  const SignupModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password,
  {{#isGender}}
      required this.gender,
  {{/isGender}}
  {{#isCountryPicker}}
      required this.countryCode
  {{/isCountryPicker}}
      });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(

        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],
{{#isGender}}
        gender: json['gender'],
{{/isGender}}
{{#isCountryPicker}}
        countryCode: json['countryCode'],
{{/isCountryPicker}}

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      {{#isGender}}
      "gender": gender,
      {{/isGender}}
    {{#isCountryPicker}}
      "countryCode": countryCode,
    {{/isCountryPicker}}
    };
  }

{{#isEquatable}}
  @override
  List<Object?> get props => [
    firstName,
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
];
{{/isEquatable}}
}
