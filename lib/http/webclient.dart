import 'package:http/http.dart';

void findAll() async{
  final Response response = await get(Uri.parse('http://192.168.11.7:8080/transactions'));
  print(response.body);

}
