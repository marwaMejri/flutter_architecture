import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_view_model.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:provider/provider.dart';

class BaseViewModelView<BaseViewModel> extends StatefulWidget {
  const BaseViewModelView({
    Key? key,
    this.onInitState,
    required this.buildWidget,
  }) : super(key: key);
  final void Function(BaseViewModel provider)? onInitState;
  final Widget Function(BaseViewModel provider) buildWidget;

  @override
  State<BaseViewModelView> createState() => _BaseViewModelViewState();
}

class _BaseViewModelViewState extends State<BaseViewModelView> {
  late final BaseViewModel _provider;
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<BaseViewModel>(context, listen: false);
    checkInternetAvailability();
    toggleLoadingWidget();
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

  void toggleLoadingWidget() {
    _provider.toggleLoading.stream.listen((bool show) {
      setState(() {
        _showLoader = show;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseViewModel>(
      builder: (BuildContext context, BaseViewModel provider, Widget? child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            widget.buildWidget(provider),
            if (_showLoader)
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 20.w,
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red,
                      ),
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
