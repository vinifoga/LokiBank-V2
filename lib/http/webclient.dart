import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:lokibankv2/models/contact.dart';
import 'package:lokibankv2/models/transaction.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('header: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('header: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

final Client client =
InterceptedClient.build(interceptors: [LoggingInterceptor()]);

Uri baseUrl = Uri.parse('http://192.168.11.7:8080/transactions');

Future<List<Transaction>> findAll() async {
  final Response response =
  await client
      .get(baseUrl)
      .timeout(
    const Duration(seconds: 5),
  );
  final List<dynamic> decodeJson = jsonDecode(response.body);

  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodeJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value' : transaction.value,
    'contact' : {
      'name' : transaction.contact.name,
      'accountNumber' : transaction.contact.accountNumber
    }
  };
  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(baseUrl,
      headers: {'Content-type': 'application/json', 'password': '1000',},
      body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
    json['value'],
    Contact(
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}
