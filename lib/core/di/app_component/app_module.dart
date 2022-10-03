import 'package:injectable/injectable.dart';

import '../../../features/weather_info/data/datasources/local_datasource/local_database.dart';

@module
abstract class AppModule {
  @preResolve
  Future<AppLocalDatabase> get prefs => AppLocalDatabase.create();
}
