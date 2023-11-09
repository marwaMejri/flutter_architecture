import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

/// this enum will present the list of supported environments
enum ProductFlavor {
  DEV,
  QA,
  SIT,
  UAT,
  PROD,
}

extension ProductFlavorExtension on ProductFlavor? {
  String setBaseUrl() {
    switch (this) {
      case ProductFlavor.DEV:
        return devBaseUrl;
      case ProductFlavor.QA:
        return qaBaseUrl;
      case ProductFlavor.SIT:
        return qaBaseUrl;
      case ProductFlavor.UAT:
        return uatBaseUrl;
      case ProductFlavor.PROD:
        return prodBaseUrl;
      default:
        return devBaseUrl;
    }
  }
}

extension StringExtension on String {
  ProductFlavor? toProductFlavor() {
    switch (this) {
      case devEnvironmentString:
        return ProductFlavor.DEV;
      case qaEnvironmentString:
        return ProductFlavor.QA;
      case sitEnvironmentString:
        return ProductFlavor.SIT;
      case uatEnvironmentString:
        return ProductFlavor.UAT;
      case prodEnvironmentString:
        return ProductFlavor.PROD;
      default:
        return null;
    }
  }
}

@singleton
class AppFlavorsHelper {
  ProductFlavor? _productFlavor;
  String? _baseUrl;

  void configure({required ProductFlavor? productFlavor}) {
    _productFlavor = productFlavor;
    _baseUrl = productFlavor?.setBaseUrl();
  }

  ProductFlavor? get productFlavor => _productFlavor;

  String? get baseUrl => _baseUrl;
}
