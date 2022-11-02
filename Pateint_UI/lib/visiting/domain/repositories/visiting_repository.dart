import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';
import '../../data/models/VisitingModel.dart';

abstract class VisitingRepository{
  Future<Either<Failures,VisitingModel>> upcomingVisit();
  Future<Either<Failures,List<VisitingModel>>> allVisits();
}