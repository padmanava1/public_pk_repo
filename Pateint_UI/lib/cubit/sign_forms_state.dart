part of 'sign_forms_cubit.dart';

@immutable
abstract class SignFormsState extends Equatable{}

class SignFormInitial extends SignFormsState {

  @override
  List<Object?> get props => [];
}

class SignFormSuccess extends SignFormsState{
  final bool updateFlag;

  SignFormSuccess({this.updateFlag=false});

  @override
  List<Object?> get props => [updateFlag];

  SignFormSuccess copyWith({bool? update}){
    return SignFormSuccess(
        updateFlag: update ?? updateFlag
    );
  }

}

