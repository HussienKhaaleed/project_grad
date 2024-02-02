import 'package:get_it/get_it.dart';
import 'package:project_test/core/database/cashe_helper.dart';
import 'package:project_test/features/auth/presentation/view_model/auth_cubit/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocter() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
