import 'package:flutter_ecommerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:flutter_ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:flutter_ecommerce_app/domain/auth/repository/auth.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/get_ages.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/get_user.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/siginup.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/signin.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/signout.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Repositories

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );

  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<SignoutUseCase>(SignoutUseCase());
}
