import 'dart:convert';

import 'package:http/http.dart'as http;

var url = "https://a8bc-2402-3a80-42b0-18c-e4ec-d86-47fa-b45b.ngrok-free.app";

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
    Uri.parse('$url/api/v1/apple'),
    // headers: header,
  );
  final res= jsonDecode(response.body);
  print(res);
  return res;
 } catch (e) {
   return;
 }
}

Future<dynamic> getStockList() async {
  // Map<String, String> header = <String, String>{
  //     "Authorization": "",
  // };
 try {
  print("stockdetails");
   final response = await http.get(
    Uri.parse('$url/api/v1/company'),
    // headers: header,
  );
  final res= jsonDecode(response.body);
  // print(res);
  return res;
 } catch (e) {
   return;
 }
}


Future<dynamic> getCarousalDetails() async {
  // Map<String, String> header = <String, String>{
  //     "Authorization": "",
  // };
 try {
   final response = await http.get(
    Uri.parse('$url/api/v1/carousel'),
    // headers: header,
  );
  final res= jsonDecode(response.body);
  print(res);
  return res;
 } catch (e) {
   return;
 }
}

