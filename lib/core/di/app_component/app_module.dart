import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/local_database.dart';
import 'package:injectable/injectable.dart';


@module
abstract class AppModule {
  @preResolve
  Future<AppLocalDatabase> get prefs => AppLocalDatabase.create();
}
