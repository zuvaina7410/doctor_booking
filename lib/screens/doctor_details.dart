import 'dart:developer';

import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:doctor_booking/screens/home.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoctorDetails extends StatelessWidget {
  final DoctorModel doctorModel;
  const DoctorDetails({super.key,required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColor,
       body: Stack(
  children: [
    Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: buttonColor,
    ),

    Positioned(
      top: 40,
      left: 20,
      child: GestureDetector(
        onTap: () {
          log("Back pressed");
          Get.back(); 
        },
        child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
      ),
    ),
    Positioned(
      top: 100,
      left: 120,
      right: 120,
     // bottom: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.network(
          doctorModel.image,
          height: 120,
          width: 120,
          fit: BoxFit.cover,
        ),
      ),),
    Positioned(
      top: MediaQuery.of(context).size.height/3,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
     //   height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: doctorModel.name,
                        size: 20,
                        color: mainTextColor,
                        weight: FontWeight.bold,
                        count: 1,
                      ),
                      customText(
                        text: doctorModel.department,
                        size: 16,
                        color: mainTextColor,
                        weight: FontWeight.normal,
                        count: 1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0,left: 15.0),
                    child: customText(
                      text: doctorModel.gender,
                      size: 14,
                      color: mainTextColor,
                      weight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
          
              const SizedBox(height: 20),

              customText(
                text: "About",
                size: 16,
                weight: FontWeight.bold,
                color: mainTextColor,
              ),
              const SizedBox(height: 8.0),
              customText(
                text:
                    "The holder of an accredited academic degree. A medical practitioner, including: Audiologist, Dentist, Optometrist, Physician, Other roles.",
                size: 14,
                color: mainTextColor,
                weight: FontWeight.normal,
                count: 5,
              ),
          
              const SizedBox(height: 100),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                          text: "Time:",
                          weight: FontWeight.bold,
                          size: 14),
                      customText(
                          text: "Location:",
                          weight: FontWeight.bold,
                          size: 14),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                          text: doctorModel.time,
                          weight: FontWeight.bold,
                          size: 14),
                      customText(
                          text: doctorModel.location,
                          weight: FontWeight.bold,
                          size: 14),
                    ],
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,

      child: GestureDetector(
        onTap: () {
        //  Get.to(BookingPage());
        },
        child: Container(
          height: 60,
          color: buttonColor,
          child: Center(child: customText(
            text: "BOOK AN APPOINTMENT",
            size: 16,
            weight: FontWeight.bold,
            color: textColor
          ),),
          ),
      ))
  ],
),

    );
  }
}

