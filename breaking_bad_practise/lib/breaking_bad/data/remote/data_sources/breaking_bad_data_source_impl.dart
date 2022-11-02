import 'package:breaking_bad_practise/breaking_bad/data/remote/data_sources/breaking_bad_data_source.dart';
import 'package:breaking_bad_practise/breaking_bad/data/remote/models/CharacterModel.dart';
import 'package:breaking_bad_practise/breaking_bad/data/remote/models/EpisodesModel.dart';
import 'package:breaking_bad_practise/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/QuotesModel.dart';

class BreakingBadDataSourceImpl extends BreakingBadDataSource {
  final Dio dio;

  BreakingBadDataSourceImpl({required this.dio});

  @override
  Future<Either<Failures, List<EpisodesModel>>> getAllEpisodes() async {
    try {
      final res = await dio.get(
        "https://www.breakingbadapi.com/api/episodes?series=Breaking+Bad",
      );
      List<EpisodesModel> episodesList = [];
      final jsonList = res.data;
      for (var item in jsonList) {
        episodesList.add(EpisodesModel.fromJson(item));
      }
      return Right(episodesList);
    } catch (e) {
      return Left(
          ServerFailure(failureMsg: "Failed to load data from Server!! T-T"));
    }
  }

  @override
  Future<Either<Failures, List<CharacterModel>>> getCharactersOfEpisodes(
      List<String> characterList) async {
    try {
      final res =
          await dio.get("https://www.breakingbadapi.com/api/characters");
      var jsonList = res.data;
      List<CharacterModel> allCharacterList = [];
      List<CharacterModel> episodeCharactersList = [];
      for (var item in jsonList) {
        allCharacterList.add(CharacterModel.fromJson(item));
      }

      characterList.forEach((element) {
        for (var items in allCharacterList) {
          if (items.name == element) {
            episodeCharactersList.add(items);
          }
        }
      });
      return Right(episodeCharactersList);
    } catch (e) {
      return Left(
          ServerFailure(failureMsg: "Sorry can't load server for characters"));
    }
  }

  @override
  Future<Either<Failures, QuotesModel>> getRandomQuotesByAuthor(
      String author) async {
    try {
      final url =
          "https://www.breakingbadapi.com/api/quote/random?author=$author";
      final uri = url.replaceAll(" ", "+");
      List<QuotesModel> modelList = [];
      final res = await dio.get(uri);
      var jsonList = res.data;
      for (var items in jsonList) {
        modelList.add(QuotesModel.fromJson(items));
      }
      // final ex = QuotesModel.fromJson(quote);

      return Right(modelList[0]);
    } catch (e) {
      return Left(ServerFailure(failureMsg: "Sorry, error occurred!"));
    }
  }

  @override
  Future<Either<Failures, List<CharacterModel>>> getRandomCharacters() async{
  try{
    final params = <String, dynamic>{
      'limit': 5,
    };
    const url = "https://www.breakingbadapi.com/api/character/random";
    final  res = await dio.get(url,
    queryParameters: params
    );
   final modelList= res.data as List;
    return Right(modelList.map((charModel) => CharacterModel.fromJson(charModel)).toList());
  }
      catch(e){
    return Left(ServerFailure(failureMsg: "Sorry , error occured !"));
      }
  }
}
