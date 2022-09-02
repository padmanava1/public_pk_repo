

class SignUpUsecase {
  final SignupRepository signupRepository;

  UserSignUp({required this.signupRepository});

  Future<Either<Failures, bool>> call(
      String firstName, String lastname, String email, String password) async {
    return await signupRepository.signUp(firstname, lastname, email, password);
  }
}
