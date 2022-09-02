
abstract class SignupRepository {

  //sign_up repository methods
  Future<Either<Failures, bool>> signUp(
      String firstName, firstName, String email, String password);

}
