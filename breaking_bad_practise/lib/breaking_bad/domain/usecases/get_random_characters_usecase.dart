import 'package:breaking_bad_practise/breaking_bad/data/remote/models/CharacterModel.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../data/remote/models/QuotesModel.dart';
import '../repositories/breaking_bad_repository.dart';

class GetRandomCharactersUsecase extends Usecase {
  BreakingBadRepository breakingBadRepository;

  GetRandomCharactersUsecase({required this.breakingBadRepository});

  @override
  Future<Either<Failures, List<CharacterModel>>> call(NoParams) {
   return breakingBadRepository.getRandomCharacters();
  }
}