import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/basecomponents/base_view_model_view.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_ui_helper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_by_coordinates_request_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_box/weather_details_box_list.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_header/weather_details_header.dart';

import '../../../../../core/commundomain/entitties/based_api_result/api_result_state.dart';
import '../../../../../core/commundomain/entitties/based_api_result/error_result_model.dart';
import '../../../../../core/utils/values/colors.dart';
import '../../add_new_city/view/add_new_city_view.dart';
import '../widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '../widgets/weather_details_data/weather_details_data_widget.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  WeatherInfoEntity? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseViewModelView<WeatherDetailsViewModel>(
          onInitState: (WeatherDetailsViewModel provider) async {
            provider.weatherResult.stream
                .listen((ApiResultState<WeatherInfoEntity?>? result) {
              result?.when(
                data: (WeatherInfoEntity? data) {
                  setState(() {
                    _result = data;
                  });
                },
                error: (ErrorResultModel error) {},
              );
            });
            await provider.getWeatherByCoordinates(
              weatherByCoordinatesRequestModel:
                  WeatherByCoordinatesRequestModel(
                lon: 10.634422,
                lat: 35.821430,
              ),
            );
          },
          buildWidget: (WeatherDetailsViewModel provider) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BaseResponsiveWidget(
                  initializeConfig: true,
                  buildWidget: (BuildContext context,
                      ResponsiveUiConfig responsiveUiConfig) {
                    return _result != null
                        ? Container(
                            width: responsiveUiConfig.screenWidth,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  _result?.weatherTheme?.secondColor ??
                                      lightBlue,
                                  _result?.weatherTheme?.firstColor ?? blue,
                                ],
                              ),
                            ),
                            child: ListView.builder(
                              itemCount: 5,
                              primary: false,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                switch (index) {
                                  case 0:
                                    {
                                      return WeatherDetailsHeader(
                                        locationName: _result?.name,
                                        date: _result?.dt,
                                      );
                                    }
                                  case 1:
                                    {
                                      return Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 20.h,
                                          ),
                                          child: Image.asset(
                                            'assets/${_result?.weather?[0]?.icon}.png',
                                            height: 150.h,
                                            width: 150.w,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      );
                                    }
                                  case 2:
                                    {
                                      return WeatherDetailsDataWidget(
                                        weatherDescription:
                                            _result?.weather?[0]?.description,
                                        weatherVisibility: _result?.visibility,
                                        mainWeatherInfoEntity: _result?.main,
                                      );
                                    }
                                  case 3:
                                    {
                                      return WeatherDetailsBoxList(
                                        sunsetSunriseEntity: _result?.sys,
                                        windInfoEntity: _result?.wind,
                                      );
                                    }
                                  default:
                                    {
                                      return SizedBox(
                                        height: 90.h,
                                      );
                                    }
                                }
                              },
                            ),
                          )
                        : Container();
                  },
                ),
                Positioned(
                  bottom: 0,
                  child: BottomNavigationBarWidget(
                    navigateToAddScreen: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AddNewCityView(
                            weatherInfoEntity: _result,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
