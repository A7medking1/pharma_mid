import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/domain/repository/base_home_repository.dart';

class DeleteFromFavoritesUseCase extends BaseUseCase<String, String> {
  final BaseHomeRepository homeRepository;

  DeleteFromFavoritesUseCase(this.homeRepository);

  @override
  Future<Either<Failure, String>> call(String parameters) async {
    return await homeRepository.deleteFromFavorite(parameters);
  }
}
