import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/auto_router_setup/auto_router.dart';
import 'package:flutter_architecture/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/app_flavor_helper/environment_config.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppComponentLocator();
  final AppFlavorsHelper configService = locator<AppFlavorsHelper>();
  final ProductFlavor? _productFlavor =
      EnvironmentConfig.BUILD_VARIANT.toProductFlavor();
  configService.configure(productFlavor: _productFlavor);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherDetailsViewModel>(
          create: (BuildContext context) => locator<WeatherDetailsViewModel>(),
        ),
        ChangeNotifierProvider<AddNewCityViewModel>(
          create: (BuildContext context) => locator<AddNewCityViewModel>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
