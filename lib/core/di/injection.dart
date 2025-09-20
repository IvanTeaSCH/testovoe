import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:testovoe/core/di/injection.config.dart';
import 'package:testovoe/feature/data/datasources/database/database.dart';

@module
abstract class DriftModule {
  @preResolve
  Future<AppDatabase> get database async => AppDatabase(); // твой Drift database
}

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => await getIt.init();
