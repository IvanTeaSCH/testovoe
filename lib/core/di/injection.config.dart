// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../feature/data/datasources/database/database.dart' as _i952;
import '../../feature/data/datasources/database/drift_service.dart' as _i527;
import '../../feature/data/datasources/user_favorite_data_source.dart' as _i165;
import '../../feature/data/datasources/user_local_data_source.dart' as _i88;
import '../../feature/data/datasources/user_remote_data_sources.dart' as _i256;
import '../../feature/data/repositories/users_repository_impl.dart' as _i490;
import '../../feature/domain/repositories/user_repository.dart' as _i360;
import '../../feature/domain/usecases/delete_favorite_user.dart' as _i965;
import '../../feature/domain/usecases/get_all_favorite.dart' as _i538;
import '../../feature/domain/usecases/get_all_users.dart' as _i552;
import '../../feature/domain/usecases/get_favorite_user.dart' as _i171;
import '../../feature/domain/usecases/save_favorite_user.dart' as _i855;
import '../../feature/presentation/bloc/favorite_bloc/favorite_bloc.dart'
    as _i594;
import '../../feature/presentation/bloc/navigation_bloc/navigation_bloc.dart'
    as _i844;
import '../../feature/presentation/bloc/setting_bloc/setting_bloc.dart'
    as _i666;
import '../../feature/presentation/bloc/users_list_bloc/users_list_bloc.dart'
    as _i878;
import '../platform/network_info.dart' as _i0;
import 'injection.dart' as _i464;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    final driftModule = _$DriftModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i952.AppDatabase>(
      () => driftModule.database,
      preResolve: true,
    );
    gh.factory<_i844.NavigationBloc>(() => _i844.NavigationBloc());
    gh.lazySingleton<_i519.Client>(() => injectionModule.httpClient);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => injectionModule.connectionChecker,
    );
    gh.factory<_i666.SettingBloc>(
      () => _i666.SettingBloc(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i0.NetworkInfo>(
      () => _i0.NetworkInfoImpl(
        connectionChecker: gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.lazySingleton<_i527.DriftUserService>(
      () => _i527.DriftUserService(gh<_i952.AppDatabase>()),
    );
    gh.lazySingleton<_i256.PersonRemoteDataSource>(
      () => _i256.PersonRemoteDataSourceImpl(client: gh<_i519.Client>()),
    );
    gh.lazySingleton<_i88.UserLocalDataSource>(
      () => _i88.UserLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i165.UserRemoteFavoriteDataSource>(
      () =>
          _i165.UserRemoteFavoriteDataSourceImpl(gh<_i527.DriftUserService>()),
    );
    gh.lazySingleton<_i360.UserRepository>(
      () => _i490.PersonRepositoryImpl(
        remoteDataSource: gh<_i256.PersonRemoteDataSource>(),
        remoteFavoriteDataSource: gh<_i165.UserRemoteFavoriteDataSource>(),
        localDataSource: gh<_i88.UserLocalDataSource>(),
        networkInfo: gh<_i0.NetworkInfo>(),
      ),
    );
    gh.factory<_i171.GetFavoriteUsers>(
      () => _i171.GetFavoriteUsers(gh<_i360.UserRepository>()),
    );
    gh.factory<_i538.GetAllFavoritePersons>(
      () => _i538.GetAllFavoritePersons(gh<_i360.UserRepository>()),
    );
    gh.factory<_i965.DeleteFavoriteUser>(
      () => _i965.DeleteFavoriteUser(gh<_i360.UserRepository>()),
    );
    gh.factory<_i855.SaveFavoriteUser>(
      () => _i855.SaveFavoriteUser(gh<_i360.UserRepository>()),
    );
    gh.factory<_i552.GetAllUsers>(
      () => _i552.GetAllUsers(gh<_i360.UserRepository>()),
    );
    gh.factory<_i594.FavoriteBloc>(
      () => _i594.FavoriteBloc(
        getAllFavoritePersons: gh<_i538.GetAllFavoritePersons>(),
        deleteFavoritePerson: gh<_i965.DeleteFavoriteUser>(),
        saveFavoritePerson: gh<_i855.SaveFavoriteUser>(),
        getFavoritePersons: gh<_i171.GetFavoriteUsers>(),
      ),
    );
    gh.factory<_i878.UsersListBloc>(
      () => _i878.UsersListBloc(
        getAllFavoriteUsers: gh<_i538.GetAllFavoritePersons>(),
        deleteFavoriteUser: gh<_i965.DeleteFavoriteUser>(),
        saveFavoriteUser: gh<_i855.SaveFavoriteUser>(),
        getFavoriteUsers: gh<_i171.GetFavoriteUsers>(),
        getAllUsers: gh<_i552.GetAllUsers>(),
      ),
    );
    return this;
  }
}

class _$InjectionModule extends _i212.InjectionModule {}

class _$DriftModule extends _i464.DriftModule {}
