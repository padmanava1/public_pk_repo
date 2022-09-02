import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup_ui/core/base/base_state.dart';
import 'package:signup_ui/signup/presentation/cubit/signup_cubit.dart';
import 'package:signup_ui/widgets/custom_textField_widget.dart';

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

  String? gender = "Male";

  final _formKey = GlobalKey<FormState>();
  bool hide = true;
  bool confirmPasswordHide = true;
  bool isCountrySelected = false;
  var countryCode = '';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
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
                  widthFactor: .6,
                  child: Image.network(
                    "https://img.freepik.com/free-vector/sign-up-concept-illustration_114360-7885.jpg?w=2000",
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
                        if (value.toString().isEmpty ) {
                          return 'Mobile number is empty';
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  favorite: ['in'],
                                  exclude: <String>[
                                    'KN',
                                    'MF'
                                  ], //It takes a list of country code(iso2).
                                  onSelect: (Country country) {
                                    BlocProvider.of<SignupCubit>(context)
                                        .selectCountry(isCountrySelected,country.phoneCode);
                                  },
                                    //phoneNumber.text = country.phoneCode
                                );
                              },
                              child:
                              (state is StateSearchResult) ? Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("+"+state.response.toString(),style: TextStyle(fontSize: 16),),
                              ) :
                              Icon(Icons.arrow_drop_down)),
                          hintText: "Enter your phone number",
                          labelText: "Phone number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          )),
                      controller: phoneNumber,
                      onChanged: (value){
                        //phoneNumber.text= (state is CountrySelected ? state.val.toString() : '' ) ;

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
                labelText: "password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState((){
                        hide = !hide;
                      });
                    },
                    child: Icon((hide)
                        ? Icons.visibility_off
                        : Icons.visibility)),
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
                            labelText: "Confirm password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                 setState((){
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
                          (state is ValidationError ? "Passwords don't match!" : ""),
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.end,
                        );
                      })
                    ],
                  ),
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_formKey.currentState!.validate()) {

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
      )),
    );
  }
}
