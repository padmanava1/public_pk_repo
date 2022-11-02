import 'package:breaking_bad_practise/breaking_bad/data/remote/models/QuotesModel.dart';
import 'package:breaking_bad_practise/core/failures/failures.dart';
import 'package:breaking_bad_practise/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/breaking_bad_repository.dart';

class GetRandomQuotesByAuthorUsecase extends Usecase {
  BreakingBadRepository breakingBadRepository;

  GetRandomQuotesByAuthorUsecase({required this.breakingBadRepository});

  @override
  Future<Either<Failures, QuotesModel>> call(author) {
    return breakingBadRepository.getRandomQuotesByAuthor(author);
  }
}
