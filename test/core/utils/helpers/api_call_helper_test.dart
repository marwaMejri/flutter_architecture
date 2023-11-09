import 'package:flutter_architecture/core/utils/helpers/http_strategy_helper/http_request_context.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class ApiCallHelperTest extends Mock
    implements HttpRequestContext {}

@GenerateMocks([ApiCallHelperTest])
class Mocks {}