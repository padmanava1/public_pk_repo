import 'package:breaking_bad_api/breaking_bad/data/models/breaking_bad_model.dart';
import 'package:breaking_bad_api/breaking_bad/data/models/student_model.dart';
import 'package:breaking_bad_api/core/error/exception.dart';
import 'package:breaking_bad_api/core/error/failure.dart';
import 'package:dio/dio.dart';


abstract class BreakingBadRemoteDatabase{
  Future<List<BreakingBadModel>> getAllCharacter();
  Future<void> addStudent(StudentModel studentModel);
  Future<List<StudentModel>> getAllStudents();
}
class BreakkingBadRemoteDatabaseImpl extends BreakingBadRemoteDatabase{
 final Dio dio;
 BreakkingBadRemoteDatabaseImpl({required this.dio});

  @override
  Future<List<BreakingBadModel>> getAllCharacter() async{
    try{
     String url = "https://www.breakingbadapi.com/api/characters";
     final res = await dio.get(url);
     List<BreakingBadModel> charList = [];
     final jsonlist = res.data;
     print(jsonlist);
     for(var item in jsonlist){
       charList.add(BreakingBadModel.fromJson(item));
     }

     return charList;
   }
   catch (e){
      print(e);
     throw LocalException();
   }

  }

  @override
  Future<void> addStudent(StudentModel studentModel)async{

    StudentModel stModel;

    try{
       String url = "http://192.168.102.221:2900/students/create";
        Response response =await dio.post(
          url,
          data: studentModel.toJson()
        );

        print(response.data);
        stModel = StudentModel.fromJson(response.data);
       return null;

    }

    catch (e){
      throw LocalException();
    }



    // TODO: implement addStudent
    throw UnimplementedError();

  }

  @override
  Future<List<StudentModel>> getAllStudents() async{
  try{
    String url = "http://192.168.102.221:2900/students";
    final res = await dio.get(url);
    List<StudentModel> studentList = [];
    final jsonlist = res.data;
    print(jsonlist);
    for(var item in jsonlist){
      studentList.add(StudentModel.fromJson(item));
    }
    return studentList;
  }
  catch (e){
    print(e);
    throw LocalException();
  }

  }



}