import 'package:breaking_bad_practise/breaking_bad/data/remote/data_sources/breaking_bad_data_source.dart';
import 'package:breaking_bad_practise/breaking_bad/data/remote/models/CharacterModel.dart';
import 'package:breaking_bad_practise/breaking_bad/data/remote/models/EpisodesModel.dart';
import 'package:breaking_bad_practise/breaking_bad/data/remote/models/QuotesModel.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:breaking_bad_practise/core/failures/failures.dart';
import 'package:dartz/dartz.dart';

class BreakingBadRepositoryImpl implements BreakingBadRepository {
  BreakingBadDataSource breakingBadDataSource;

  BreakingBadRepositoryImpl({required this.breakingBadDataSource});

  @override
  Future<Either<Failures, List<EpisodesModel>>> getAllEpisodes() {
    return breakingBadDataSource.getAllEpisodes();
  }

  @override
  Future<Either<Failures, List<CharacterModel>>> getCharactersOfEpisodes(
      List<String> charactersList) {
    // TODO: implement getCharacters
    return breakingBadDataSource.getCharactersOfEpisodes(charactersList);
  }

  @override
  Future<Either<Failures, QuotesModel>> getRandomQuotesByAuthor(String author) {
    // TODO: implement getRandomQuotesByAuthor
    return breakingBadDataSource.getRandomQuotesByAuthor(author);
  }

  @override
  Future<Either<Failures, List<CharacterModel>>> getRandomCharacters() {
    return breakingBadDataSource.getRandomCharacters();
  }
}
