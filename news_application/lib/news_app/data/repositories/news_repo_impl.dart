
import 'package:dartz/dartz.dart';
import 'package:news_application/core/failures/failures.dart';
import 'package:news_application/news_app/data/data_sources/newsDataSource.dart';
import 'package:news_application/news_app/data/models/HeadlinesModel.dart';
import 'package:news_application/news_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<Either<Failures, List<HeadlinesModel>>> getHeadlines() async{
    // TODO: implement getHeadlines
    return await newsRemoteDataSource.getHeadlinesDataSource();
  }

}