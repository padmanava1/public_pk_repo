import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  final Dio dio;
  final SharedPreferences sharedPreferences;
  final FacebookAuth facebookAuth;
  SignUpDataSourceImpl(
      {required this.auth,
      required this.dio,
      required this.sharedPreferences,
      required this.googleSignIn,
      required this.facebookAuth});

  // sign_up data_source methods impl
  @override
  Future<Either<Failures, bool>> signUp(
      {required String firstName,
        required String lastName,
        required String email,
        required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      await auth.currentUser!.updateDisplayName(fullName);
      user!.sendEmailVerification();
      if (user != null) {
        final response = await dio.post('${BaseConstant.baseUrl}user/post',
            options: await createDioOptions());
        await userSignOut();
        if (response.statusCode == 409) {
          return Left(
              AuthFailure(failureMsg: "Enter Email is Already Registered"));
        } else {
          if (response.statusCode == 200) {
            return const Right(true);
          } else {
            return Left(ServerFailure());
          }
        }
      } else {
        return Left(ServerFailure());
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        return Left(
            AuthFailure(failureMsg: "Enter Email is Already Registered"));
      } else {
        return Left(ServerFailure(failureMsg: "Something went Wrong"));
      }
    }
  }


}
