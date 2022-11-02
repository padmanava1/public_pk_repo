import 'package:breaking_bad_practise/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:breaking_bad_practise/core/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';
import '../../data/remote/models/EpisodesModel.dart';

class GetAllEpisodesUsecase extends Usecase {
  BreakingBadRepository breakingBadRepository;

  GetAllEpisodesUsecase({required this.breakingBadRepository});

  @override
  Future<Either<Failures, List<EpisodesModel>>> call(NoParams) {
    return breakingBadRepository.getAllEpisodes();
  }
}
