part of services;

final GetIt sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    /// app prefs

    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerFactory<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    /// Dio
    sl.registerLazySingleton<Dio>(() => Dio());

    sl.registerLazySingleton(
      () => PrettyDioLogger(
        request: false,
        responseBody: false,
      ),
    );
    sl.registerLazySingleton(() => AppInterceptors());

    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

    /// TODO
    authInjection();
    homeInjection();
    //
  }

  void authInjection() {
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()));

    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    sl.registerLazySingleton(() => LoginUseCase(sl()));

    sl.registerFactory(() => AuthBloc(sl()));
  }

  void homeInjection() {
    sl.registerLazySingleton<HomeBaseRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    sl.registerLazySingleton(() => GetSpeakersUseCase(sl()));
    sl.registerLazySingleton(() => GetHomeProgrammesUseCase(sl()));
    sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));
    sl.registerLazySingleton(() => DeleteFromFavoritesUseCase(sl()));
    sl.registerLazySingleton(() => AddToFavoritesUseCase(sl()));
    sl.registerLazySingleton(() => GetSearchProgrammesUseCase(sl()));
    sl.registerLazySingleton(() => GetQrCodeUseCase(sl()));
    sl.registerLazySingleton(() => CheckQrCodeUseCase(sl()));
    // sl.registerLazySingleton(() => GetAgendaCase(sl()));
    sl.registerLazySingleton(() => PauseAccountUseCase(sl()));

    sl.registerFactory(() => SpeakersBloc(sl()));
    sl.registerFactory(() => ProgrammesBloc(sl()));
    sl.registerFactory(() => FavoriteBloc(sl(), sl(), sl()));
    sl.registerFactory(() => SearchBloc(sl()));
    sl.registerFactory(() => QrCodeBloc(sl()));
    sl.registerFactory(() => ProfileBloc(sl()));
  }
}
