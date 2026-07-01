import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

/// Global service locator instance.
final GetIt getIt = GetIt.instance;

/// Initializes all injectable dependencies.
/// Call this before [runApp] in main.dart.
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => getIt.init();
