import 'package:flutter_architecture/core/di/app_component/app_component.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt locator = GetIt.I;

@InjectableInit(
  preferRelativeImports: false,
  asExtension: false,
)
@injectableInit
Future<void> initAppComponentLocator() async => $initGetIt(locator);