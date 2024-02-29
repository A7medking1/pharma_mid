import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/domain/repository/base_home_repository.dart';

class AddToFavoritesUseCase extends BaseUseCase<String, String> {
  final BaseHomeRepository homeRepository;

  AddToFavoritesUseCase(this.homeRepository);

  @override
  Future<Either<Failure, String>> call(String itemId) async {
    return await homeRepository.addToFavorite(itemId);
  }
}
