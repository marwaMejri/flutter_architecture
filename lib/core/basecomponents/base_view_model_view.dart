import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/basecomponents/base_view_model.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:provider/provider.dart';

import '../utils/helpers/responsive_ui_helper/responsive_ui_helper.dart';

class BaseViewModelView<T> extends StatefulWidget {
  const BaseViewModelView({
    Key? key,
    this.onInitState,
    required this.buildWidget,
  }) : super(key: key);
  final void Function(T provider)? onInitState;
  final Widget Function(T provider) buildWidget;

  @override
  State<BaseViewModelView<T>> createState() => _BaseViewModelViewState<T>();
}

class _BaseViewModelViewState<T> extends State<BaseViewModelView<T>> {
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();
    final T _provider = Provider.of<T>(context, listen: false);
    checkInternetAvailability();
    toggleLoadingWidget(_provider);
    if (widget.onInitState != null) {
      widget.onInitState!(_provider);
    }
  }

  void checkInternetAvailability() {
    ConnectivityCheckerHelper.listenToConnectivityChanged()
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(commonConnectionFailedMessage),
          ),
        );
      }
    });
  }

  void toggleLoadingWidget(T provider) {
    (provider as BaseViewModel).toggleLoading.stream.listen((bool show) {
      setState(() {
        _showLoader = show;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (BuildContext context, T provider, Widget? child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            widget.buildWidget(provider),
            if (_showLoader)
              BaseResponsiveWidget(
                buildWidget: (BuildContext context,
                    ResponsiveUiConfig responsiveUiConfig) {
                  return AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: responsiveUiConfig.screenWidth,
                      height: responsiveUiConfig.screenHeight,
                      color: Colors.transparent,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          padding: EdgeInsets.all(
                            15.w,
                          ),
                          width: 70.w,
                          height: 70.w,
                          child: CircularProgressIndicator(
                            color: lightColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
