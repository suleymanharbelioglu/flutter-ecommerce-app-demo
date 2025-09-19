import 'package:flutter_ecommerce_app/domain/auth/entity/user.dart';

abstract class UserInfoDisplayState {}

class UserInfoLoading extends UserInfoDisplayState {}

class UserInfoLoaed extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoLoaed({required this.user});
}

class LoadUserInfoFailure extends UserInfoDisplayState {}
