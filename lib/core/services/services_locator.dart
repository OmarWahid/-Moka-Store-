import 'package:get_it/get_it.dart';
import 'package:moka_store/moka/domain/use_cases/get_electronics_use_case.dart';

import '../../moka/data/data_sources/moka_remote_data_source.dart';
import '../../moka/data/repositories/moka_repository.dart';
import '../../moka/domain/repositories/base_moka_respositry.dart';
import '../../moka/presentation/controller/moka_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// BLOC
    sl.registerFactory(() => MokaBloc(sl()));

    /// USE CASES
    sl.registerLazySingleton(() => GetElectronicsProductUseCase(sl()));

    /// REPOSITORY
    sl.registerLazySingleton<BaseMokaRepository>(() => MokaRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMokaRemoteDataSource>(
        () => MokaRemoteDataSource());
  }
}
