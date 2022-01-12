
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import 'interceptors/logging_interceptor.dart';

final Client client =
InterceptedClient.build(interceptors: [LoggingInterceptor()]);

Uri baseUrl = Uri.parse('http://192.168.11.7:8080/transactions');

