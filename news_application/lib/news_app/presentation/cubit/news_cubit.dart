
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/core/usecases/usecase.dart';
import 'package:news_application/news_app/data/models/HeadlinesModel.dart';
import 'package:news_application/news_app/presentation/cubit/news_state.dart';

import '../../domain/use_cases/headlines_usecase.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsUsecase newsUsecase;
  NewsCubit({required this.newsUsecase}) : super(NewsInitial()){
    getNewsHeadlines();
  }

  getNewsHeadlines() async{
      final res = await newsUsecase.call(NoParams());
      res.fold((l) {
        print("fail");
        debugPrint(l.toString());
        }, (r){

        print("success");
        emit(StateOnSuccess<List<HeadlinesModel>>(headlist: r));});
  }
}
