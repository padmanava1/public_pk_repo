import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController firstName = TextEditingController();

  final TextEditingController lastName = TextEditingController();

  late TextEditingController phoneNumber = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();
  {{#isGender}}
  String? gender = "Male";
  {{/isGender}}

  final _formKey = GlobalKey<FormState>();
  bool hide = true;
  bool confirmPasswordHide = true;

  {{#isCountryPicker}}
  bool isCountrySelected = false;
  var countryCode = '91';
  {{/isCountryPicker}}
  var regexEmail = RegExp(r'\S+@\S+\.\S+');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                'Create Your New Account',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900]),
              )),
              Center(
                child: FractionallySizedBox(
                  widthFactor: .9,
                  child: Image.network(
                    "https://cdni.iconscout.com/illustration/premium/thumb/user-account-sign-up-4489360-3723267.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'First name is empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your first name",
                    labelText: "First Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  controller: firstName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Last name is empty';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your last name",
                      labelText: "Last Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                  controller: lastName,
                  //controller: fullName,
                ),
              ),
              BlocBuilder<SignupCubit, BaseState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Mobile number is empty';
                        }
                      },
                      decoration: InputDecoration(
                        {{#isCountryPicker}}
                          prefixIcon:
                          GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  favorite: ['in'],
                                  onSelect: (Country country) {
                                    BlocProvider.of<SignupCubit>(context)
                                        .selectCountry(isCountrySelected,
                                            country.phoneCode);
                                    countryCode = country.phoneCode.toString();
                                  },
                                );
                              },
                              child: (state is StateSearchResult)
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          top: 14.0,
                                          bottom: 16.0,
                                          right: 6.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                              child:
                                                  Icon(Icons.arrow_drop_down)),
                                          Flexible(
                                            child: Text(
                                              "+" + state.response.toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 14.0,
                                    bottom: 16.0,
                                    right: 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                        child:
                                        Icon(Icons.arrow_drop_down)),
                                    Flexible(
                                      child: Text(
                                        "+" + countryCode,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          {{/isCountryPicker}}

                          hintText: "Enter your phone number",

                          labelText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          )),
                      controller: phoneNumber,
                      onChanged: (value) {
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Email is empty';
                    }
                    else if(regexEmail.hasMatch(value.toString()) == false){
                      return "Enter valid email";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                  controller: email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Password is empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        child: Icon(
                            (hide) ? Icons.visibility_off : Icons.visibility)),
                  ),
                  obscureText: hide,
                  controller: password,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Confirm password is empty!';
                        } else if (confirmPassword.text != password.text) {
                          return "Passwords do not match!";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Confirm your password",
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                confirmPasswordHide = !confirmPasswordHide;
                              });
                            },
                            child: Icon((confirmPasswordHide)
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                      obscureText: confirmPasswordHide,
                      controller: confirmPassword,
                    ),
                  ),
                  BlocBuilder<SignupCubit, BaseState>(
                      builder: (context, state) {
                    return Text(
                      (state is ValidationError
                          ? "Passwords don't match!"
                          : ""),
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.end,
                    );
                  })
                ],
              ),


              {{#isGender}}
             //Gender portion
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Text(
                      'Select your Gender',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  RadioListTile(
                    title: Text("Male"),
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Female"),
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Other"),
                    value: "Other",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ],
              ),
              {{/isGender}}

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<SignupCubit>(context).signUpData(
                              firstName.text,
                              lastName.text,
                              email.text,
                              phoneNumber.text,
                              password.text,
                              {{#isGender}}
                              gender,
                              {{/isGender}}

                              {{#isCountryPicker}}
                              countryCode
                              {{/isCountryPicker}}
                          );
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: const TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  Text(
                    'sign in',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
