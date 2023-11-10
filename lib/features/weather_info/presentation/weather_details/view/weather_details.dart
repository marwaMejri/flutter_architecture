import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/basecomponents/base_view_model_view.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_state.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/utils/auto_router_setup/auto_router.gr.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_box/weather_details_box_list.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_data/weather_details_data_widget.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_header/weather_details_header.dart';
import 'package:flutter_architecture/features/weather_info/utils/requests_models/weather_by_coordinates_request_model.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class WeatherDetailsView extends StatefulWidget {
  const WeatherDetailsView({
    Key? key,
    this.weatherInfoEntity,
  }) : super(key: key);
  final WeatherInfoEntity? weatherInfoEntity;

  @override
  State<WeatherDetailsView> createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  WeatherInfoEntity? _result;
  bool? _isSuccess;

  Future<void> _getWeatherData(WeatherDetailsViewModel provider) async {
    await provider.getWeatherByCoordinates(
      weatherByCoordinatesRequestModel: WeatherByCoordinatesRequestModel(
        lon: 10.634422,
        lat: 35.821430,
      ),
    );
  }

  Widget _getWidget(ResponsiveUiConfig responsiveUiConfig) {
    if (_isSuccess == false) {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: responsiveUiConfig.screenHeight,
            child: Center(
              child: Lottie.asset(
                'assets/lottie_animation.json',
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.weatherInfoEntity != null) {
      _result = widget.weatherInfoEntity;
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: SafeArea(
        child: BaseViewModelView<WeatherDetailsViewModel>(
          onInitState: (WeatherDetailsViewModel provider) async {
            provider.weatherResult.stream.listen(
              (ApiResultState<WeatherInfoEntity?>? result) {
                result?.when(
                  data: (WeatherInfoEntity? data) {
                    if (!mounted) {
                      return;
                    }
                    setState(() {
                      _result = data;
                      _isSuccess = data != null;
                    });
                  },
                  error: (ErrorResultModel error) {
                    print(error);
                  },
                );
              },
            );
            if (widget.weatherInfoEntity == null) {
              await _getWeatherData(provider);
            }
          },
          buildWidget: (WeatherDetailsViewModel provider) {
            return BaseResponsiveWidget(
              initializeConfig: true,
              buildWidget: (BuildContext context,
                  ResponsiveUiConfig responsiveUiConfig,
                  AppConfigurations appConfigurations) {
                return RefreshIndicator(
                  backgroundColor:
                      appConfigurations.appTheme.backgroundLightColor,
                  color: appConfigurations.appTheme.primaryColor,
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  strokeWidth: 2.w,
                  onRefresh: () async {
                    _getWeatherData(provider);
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      if (_result != null)
                        Container(
                          width: responsiveUiConfig.screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                _result?.weatherTheme?.secondColor ??
                                    appConfigurations.appTheme.secondaryColor,
                                _result?.weatherTheme?.firstColor ??
                                    appConfigurations.appTheme.thirdColor,
                              ],
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: 5,
                            primary: false,
                            physics: const BouncingScrollPhysics(),
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
                      else
                        _getWidget(responsiveUiConfig),
                      Positioned(
                        bottom: 0,
                        child: BottomNavigationBarWidget(
                          navigateToAddScreen: () {
                            context.pushRoute(
                              const AddNewCityView(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
