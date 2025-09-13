
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/domain/auth/repository/auth.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool,dynamic> {

  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}