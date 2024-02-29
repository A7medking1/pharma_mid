import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/repository/base_home_repository.dart';

class GetSpeakersUseCase
    extends BaseUseCase<List<SpeakersModel>, int> {
  final BaseHomeRepository homeRepository;

  GetSpeakersUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<SpeakersModel>>> call(
      int parameters) async {
    return await homeRepository.getSpeakers(parameters);
  }
}
