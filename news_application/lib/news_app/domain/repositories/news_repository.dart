import 'package:dartz/dartz.dart';
import 'package:news_application/core/failures/failures.dart';

import '../../data/models/HeadlinesModel.dart';

abstract class NewsRepository {
  Future<Either<Failures, List<HeadlinesModel>>> getHeadlines();
}