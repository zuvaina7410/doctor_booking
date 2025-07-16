
import 'dart:convert';
import 'dart:developer';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:http/http.dart'as http;


class Webservice {
  
Future<List<DoctorModel>?> fetchDoctorsList() async {
  try{
  final response = await http.get(Uri.parse("https://686f534991e85fac42a07d85.mockapi.io/api/v1/test/doctors/"));
  if(response.statusCode==200){
    final parsed= json.decode(response.body).cast<Map<String,dynamic>>();
    return parsed.map<DoctorModel>((json)=>DoctorModel.fromJson(json)).toList();
  }
  else{
throw Exception('Failed to load doctor list');
  }
  }
  catch(e){
    log("Fetch Data Service ===${e.toString()}");
  }

}

}