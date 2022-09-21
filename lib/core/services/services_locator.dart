import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // /// BLOC
    // sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    // sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    //
    // /// USE CASES
    // sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    // sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    // sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    // sl.registerLazySingleton(() => GetDetailsMovieUseCase(sl()));
    // sl.registerLazySingleton(() => GetRecommendationsMovieUseCase(sl()));
    //
    // /// REPOSITORY
    // sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    //
    // /// DATA SOURCE
    // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
    //     () => MovieRemoteDataSource());
  }
}
