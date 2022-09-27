import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/basecomponents/base_view_model_view.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_ui_helper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_by_coordinates_request_model.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseViewModelView<WeatherDetailsViewModel>(
        onInitState: (WeatherDetailsViewModel provider){
          provider.weatherResult.stream.listen((event) {
            print(event);
          });
        },
        buildWidget: (WeatherDetailsViewModel provider) {
          return BaseResponsiveWidget(
            initializeConfig: true,
            buildWidget:
                (BuildContext context, ResponsiveUiConfig responsiveUiConfig) {
              return Center(
                child: GestureDetector(
                  onTap: () async {
                    await provider.getWeatherByCoordinates(
                      weatherByCoordinatesRequestModel:
                          WeatherByCoordinatesRequestModel(
                        lat: 33.44,
                        lon: -94.04,
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.red,
                    child: Text('Press'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
