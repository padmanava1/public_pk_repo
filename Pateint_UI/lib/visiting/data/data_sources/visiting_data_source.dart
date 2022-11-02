import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';
import '../models/VisitingModel.dart';

abstract class VisitingDataSource{
  Future<Either<Failures, VisitingModel>> upcomingVisit();
  Future<Either< Failures, List<VisitingModel>>> allVisits();


}