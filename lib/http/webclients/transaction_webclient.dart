import 'dart:convert';

import 'package:http/http.dart';
import 'package:lokibankv2/http/webclient.dart';
import 'package:lokibankv2/models/transaction.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl).timeout(
          const Duration(seconds: 5),
        );
    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if(response.statusCode == 400){
      throw Exception('There was an error submitting transaction');
    }
    if(response.statusCode == 401){
      throw Exception('Authentication Failed');
    }


    return Transaction.fromJson(jsonDecode(response.body));
  }
}
