import 'package:breaking_bad_practise/breaking_bad/data/remote/models/QuotesModel.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../models/CharacterModel.dart';
import '../models/EpisodesModel.dart';

abstract class BreakingBadDataSource {
  Future<Either<Failures, List<EpisodesModel>>> getAllEpisodes();

  Future<Either<Failures, List<CharacterModel>>> getCharactersOfEpisodes(
      List<String> charactersList);

  Future<Either<Failures, QuotesModel>> getRandomQuotesByAuthor(String author);

  Future<Either<Failures, List<CharacterModel>>> getRandomCharacters();
}
