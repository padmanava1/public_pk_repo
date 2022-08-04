import 'package:bloc/bloc.dart';
import 'package:breaking_bad_api/breaking_bad/data/models/breaking_bad_model.dart';
import 'package:breaking_bad_api/breaking_bad/data/models/student_model.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/addStudent.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getAllCharacterUsecase.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getStudents.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getStudents.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getStudents.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getStudents.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getStudents.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getStudents.dart';
import 'package:breaking_bad_api/core/error/failure.dart';
import 'package:breaking_bad_api/core/usecase/usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'breaking_bad_state.dart';

class BreakingBadCubit extends Cubit<BreakingBadState> {
  GetAllCharacterUsecase getAllCharacterUsecase;
  AddStudent addStudent;
  getAllStudents getallstudents;
  BreakingBadCubit({required this.getAllCharacterUsecase, required this.addStudent, required this.getallstudents})
      : super(BreakingBadInitial());

  getAllCharacter() async{
    await Future.delayed(Duration(seconds: 2));
    var res = await getAllCharacterUsecase.call(NoParams());
    debugPrint('Success');
    res?.fold((l) { debugPrint(l.toString());}, (r) {emit(BreakingBadSuccessState(breakinglist: r));});

  }

  addStudents(String name,String address)async{
    debugPrint('Success again');
    var res = await addStudent.call(StudentModel(name: name , address: address));

  }

 getstudents() async{
    var res = await getallstudents.call(NoParams());
    debugPrint('Success');
    res?.fold((l) => { debugPrint(l.toString())}, (r) => {emit(getAllStudentsSuccessState(studentList: r))});
 }



}
