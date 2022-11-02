import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';
import '../../data/remote/models/CharacterModel.dart';
import '../../data/remote/models/EpisodesModel.dart';
import '../../data/remote/models/QuotesModel.dart';

abstract class BreakingBadRepository {
  Future<Either<Failures, List<EpisodesModel>>> getAllEpisodes();

  Future<Either<Failures, List<CharacterModel>>> getCharactersOfEpisodes(
      List<String> charactersList);

  Future<Either<Failures, QuotesModel>> getRandomQuotesByAuthor(String author);

  Future<Either<Failures, List<CharacterModel>>> getRandomCharacters();
}
