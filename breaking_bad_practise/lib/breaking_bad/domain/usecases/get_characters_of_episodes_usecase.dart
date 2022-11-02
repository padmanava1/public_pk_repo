import 'package:breaking_bad_practise/breaking_bad/data/remote/models/CharacterModel.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:breaking_bad_practise/core/failures/failures.dart';
import 'package:breaking_bad_practise/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCharactersOfEpisodesUsecase extends Usecase {
  BreakingBadRepository breakingBadRepository;

  GetCharactersOfEpisodesUsecase({required this.breakingBadRepository});

  @override
  Future<Either<Failures, List<CharacterModel>>> call(charactersList) {
    return breakingBadRepository.getCharactersOfEpisodes(charactersList);
  }
}
