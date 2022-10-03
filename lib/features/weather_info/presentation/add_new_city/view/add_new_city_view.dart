import 'package:flutter/material.dart';

import '../../../domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import '../widgets/add_new_city_box_details/add_new_city_box_details_widget.dart';
import '../widgets/add_new_city_header/add_new_city_header_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              {
                return AddNewCityHeaderWidget();
              }
            default:
              {
                return AddNewCityBoxDetailsWidget(
                  weatherInfoEntity: widget.weatherInfoEntity,
                );
              }
          }
        },
      ),
    );
  }
}
