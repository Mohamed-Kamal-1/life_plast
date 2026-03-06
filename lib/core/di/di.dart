import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart'; // هذا الملف يتم توليده تلقائياً

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();