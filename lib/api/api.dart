import 'dart:convert';

import 'package:http/http.dart'as http;

Future<dynamic> getTopGainers() async {
  // Map<String, String> header = <String, String>{
  //     "Authorization": "",
  // };
 try {
  print("taniik");
   final response = await http.get(
    Uri.parse('https://ef97-14-139-125-227.ngrok-free.app/top_gainers'),
    // headers: header,
  );
  final res= jsonDecode(response.body);
  print(res);
  return res;
 } catch (e) {
   return;
 }
}

Future<dynamic> getTopLosers() async {
  // Map<String, String> header = <String, String>{
  //     "Authorization": "",
  // };
 try {
  print("losers");
   final response = await http.get(
    Uri.parse('https://5185-2409-40c0-8-769-7dea-7d02-459e-f5d5.ngrok-free.app/top_losers'),
    // headers: header,
  );
  final res= jsonDecode(response.body);
  print(res);
  return res;
 } catch (e) {
   return;
 }
}


Future<dynamic> getStockDetails(String stockName) async {
  // Map<String, String> header = <String, String>{
  //     "Authorization": "",
  // };
 try {
  print("stockdetails");
   final response = await http.get(
    Uri.parse('https://909f-14-139-125-227.ngrok-free.app/api/v1/apple'),
    // headers: header,
  );
  final res= jsonDecode(response.body);
  print(res);
  return res;
 } catch (e) {
   return;
 }
}
