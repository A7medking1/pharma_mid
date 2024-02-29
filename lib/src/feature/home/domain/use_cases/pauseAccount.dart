import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/domain/repository/base_home_repository.dart';

class PauseAccountUseCase extends BaseUseCase<String, NoParameters> {
  final BaseHomeRepository homeRepository;

  PauseAccountUseCase(this.homeRepository);

  @override
  Future<Either<Failure, String>> call(NoParameters parameters) async {
    return await homeRepository.pauseAccount();
  }
}
