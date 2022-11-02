import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/failures/failures.dart';
import '../models/HeadlinesModel.dart';

abstract class NewsRemoteDataSource {
  Future<Either<Failures, List<HeadlinesModel>>> getHeadlinesDataSource();

}
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  late final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<Failures, List<HeadlinesModel>>> getHeadlinesDataSource() async{
    try{
      final url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=4731dc8621dd4a8687c706a91e6a437d";
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<HeadlinesModel> headlineList = [];
        final jsonList = response.data["articles"];
        for (var item in jsonList) {
          headlineList.add(HeadlinesModel.fromJson(item));
        }
        return right(headlineList);
      } else if (response.statusCode == 505) {
        return Left(ServerFailure());
      } else if (response.statusCode == 404) {
        return Left(
            AuthFailure()); //Data Not Found Failure but in failure there is not method so AuthFailure
      } else {
        return Left(InternetFailure());
      }
    
    }
    catch(e){
      return Left(ServerFailure(failureMsg: e.toString()));}
  }
}