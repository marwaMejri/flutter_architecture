import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_view_model_view.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_state.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/widgets/add_new_city_box_details/add_new_city_box_details_widget.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/widgets/add_new_city_header/add_new_city_header_widget.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/widgets/searsh_city/search_city_widget.dart';

class AddNewCityView extends StatefulWidget {
  const AddNewCityView({
    Key? key,
    this.weatherInfoEntity,
  }) : super(key: key);
  final WeatherInfoEntity? weatherInfoEntity;

  @override
  State<AddNewCityView> createState() => _AddNewCityViewState();
}

class _AddNewCityViewState extends State<AddNewCityView> {
  List<WeatherInfoEntity?> _citiesWeatherList = <WeatherInfoEntity?>[];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _citiesWeatherList.add(widget.weatherInfoEntity);
  }

  WeatherInfoEntity? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseViewModelView<AddNewCityViewModel>(
          onInitState: (AddNewCityViewModel provider) async {
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
          },
          buildWidget: (AddNewCityViewModel provider) {
            return ListView.builder(
              itemCount: _citiesWeatherList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    {
                      return AddNewCityHeaderWidget();
                    }
                  default:
                    {
                      return AddNewCityBoxDetailsWidget(
                        weatherInfoEntity: _citiesWeatherList[index - 1],
                      );
                    }
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: orange,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SearchCityWidget(
                controller: _controller,
                onTapFunction: () {},
              );
            },
          );
        },
      ),
    );
  }
}
