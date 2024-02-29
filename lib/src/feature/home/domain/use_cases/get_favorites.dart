import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/home_programmes_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/repository/base_home_repository.dart';

class GetFavoritesUseCase
    extends BaseUseCase<List<HomePrograms>, NoParameters> {
  final BaseHomeRepository homeRepository;

  GetFavoritesUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<HomePrograms>>> call(
      NoParameters parameters) async {
    return await homeRepository.getFavorites();
  }
}
