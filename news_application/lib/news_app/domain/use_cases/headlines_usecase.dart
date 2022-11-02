import 'package:dartz/dartz.dart';
import 'package:news_application/core/failures/failures.dart';
import 'package:news_application/news_app/domain/repositories/news_repository.dart';

import '../../../core/usecases/usecase.dart';
import '../../data/models/HeadlinesModel.dart';

class NewsUsecase implements Usecase<List<HeadlinesModel>, NoParams> {
  final NewsRepository newsRepository;

  NewsUsecase( this.newsRepository);

  @override
  Future<Either<Failures, List<HeadlinesModel>>> call(NoParams params) async{
    // TODO: implement call
   return await newsRepository.getHeadlines();
  }






}