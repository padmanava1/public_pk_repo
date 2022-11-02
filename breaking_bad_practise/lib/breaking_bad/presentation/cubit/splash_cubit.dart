import 'package:bloc/bloc.dart';
import 'package:breaking_bad_practise/core/base/base_state.dart';

class SplashCubit extends Cubit<BaseState> {
  SplashCubit() : super(StateInitial());

  showSplash() async {
    await Future.delayed(const Duration(seconds: 4));
    emit(StateNoData());
  }
}
