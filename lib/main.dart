import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/screens/doctor_details.dart';
import 'package:doctor_booking/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking Doctor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: buttonColor),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

