import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/basecomponents/base_view_model_view.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_state.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/utils/auto_router_setup/auto_router.gr.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/extension_functions.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/widgets/add_new_city_box_details/add_new_city_box_details_widget.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/widgets/add_new_city_header/add_new_city_header_widget.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/widgets/searsh_city/search_city_widget.dart';

@RoutePage()
class AddNewCityView extends StatefulWidget {
  const AddNewCityView({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewCityView> createState() => _AddNewCityViewState();
}

class _AddNewCityViewState extends State<AddNewCityView> {
  final List<WeatherInfoEntity?> _citiesWeatherList = <WeatherInfoEntity?>[];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  AddNewCityViewModel? _provider;

  bool _checkItemInList() {
    bool _itemFound = false;
    _citiesWeatherList.forEach(
      (WeatherInfoEntity? item) {
        if (_controller.text.isEqual(item?.name)) {
          _itemFound = true;
        }
        return;
      },
    );
    return _itemFound;
  }

  void _listenToNewCityData() {
    _provider?.weatherResult.stream
        .listen((ApiResultState<WeatherInfoEntity?>? result) {
      result?.when(
        data: (WeatherInfoEntity? data) {
          if (!_citiesWeatherList
              .any((WeatherInfoEntity? element) => element?.id == data?.id)) {
            setState(() {
              _citiesWeatherList.add(data);
            });
          }
        },
        error: (ErrorResultModel error) {},
      );
    });
  }

  void _listenToInitialLocalData() {
    _provider?.weatherLocalResult.stream
        .listen((ApiResultState<List<WeatherInfoEntity?>?>? result) {
      result?.when(
        data: (List<WeatherInfoEntity?>? data) {
          if (data != null) {
            if (!mounted) {
              return;
            }
            setState(() {
              _citiesWeatherList.addAll(data);
            });
          }
        },
        error: (ErrorResultModel error) {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      buildWidget: (BuildContext context, ResponsiveUiConfig responsiveUiConfig,
              AppConfigurations appConfigurations) =>
          Scaffold(
        backgroundColor: appConfigurations.appTheme.primaryColor,
        body: SafeArea(
          child: BaseViewModelView<AddNewCityViewModel>(
            onInitState: (AddNewCityViewModel provider) async {
              _provider = provider;
              _listenToInitialLocalData();
              _listenToNewCityData();
              await provider.getAllLocalWeathersData();
            },
            buildWidget: (AddNewCityViewModel provider) {
              return ListView.builder(
                itemCount: _citiesWeatherList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      {
                        return const AddNewCityHeaderWidget();
                      }
                    default:
                      {
                        return _citiesWeatherList.isNotEmpty
                            ? AddNewCityBoxDetailsWidget(
                                onClickBox:
                                    (WeatherInfoEntity? weatherInfoEntity) {
                                  context.pushRoute(
                                    WeatherDetailsView(
                                        weatherInfoEntity: weatherInfoEntity),
                                  );
                                },
                                weatherInfoEntity:
                                    _citiesWeatherList[index - 1],
                              )
                            : Container();
                      }
                  }
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          backgroundColor: appConfigurations.appTheme.secondaryColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SearchCityWidget(
                  controller: _controller,
                  onTapFunction: () async {
                    if (_controller.text.isNotEmpty && !_checkItemInList()) {
                      await _provider?.getWeatherByCity(
                          cityName: _controller.text);
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
