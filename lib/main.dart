import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/view/weather_details.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppComponentLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<WeatherDetailsViewModel>(
            create: (BuildContext context) =>
                locator<WeatherDetailsViewModel>(),
          ),
        ],
        child: WeatherDetails(),
      ),
    );
  }
}
