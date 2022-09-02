

class SignupRepositoryImpl implements SignupRepository {
  final SignUpDataSource signUpDataSource;

  SignupRepositoryImpl({required this.signupDataSource});

  //Signup anonymous repository methods impl


  @override
  Future<Either<Failures, bool>> signUp(
      String fullName, String email, String password) async {
    return await signupDataSource.signUp(
        fullName: firstName,
        lastName: lastname,
        email: email.toString(),
        password: password.toString());
  }


}
