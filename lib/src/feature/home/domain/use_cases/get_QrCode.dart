import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/qr_code_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/repository/base_home_repository.dart';

class GetQrCodeUseCase extends BaseUseCase<List<QrCodeModel>, String> {
  final BaseHomeRepository homeRepository;

  GetQrCodeUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<QrCodeModel>>> call(String email) async {
    return await homeRepository.getQrCode(email);
  }
}
