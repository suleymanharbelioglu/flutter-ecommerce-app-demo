import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/usecase/usecase.dart';
import 'package:flutter_ecommerce_app/data/auth/model/user_signin_req.dart';
import 'package:flutter_ecommerce_app/domain/auth/repository/auth.dart';
import 'package:flutter_ecommerce_app/service_locator.dart';

class SigninUseCase implements UseCase<Either,UserSigninReq> {

  @override
  Future<Either> call({UserSigninReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }

}