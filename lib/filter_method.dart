
import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/controller/doctor_controller.dart';
import 'package:doctor_booking/controller/filter_controller.dart';

import 'package:doctor_booking/widgets/custom_choicechip.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_booking/widgets/custom_radiobutton.dart';


void showFilterDialog() {
  final filterController = Get.put(FilterController());
  //final DoctorController doctorController =Get.put(DoctorController());
  final DoctorController doctorController = Get.find<DoctorController>();

  Get.defaultDialog(
    title: "Filter by",
    radius: 5,
    content: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                genderRadio("Male", filterController),
                genderRadio("Female", filterController),
                genderRadio("Others", filterController),
              ],
            ),
             Divider(height: 25,color: buttonColor,),

            const Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 timeChip("06:00 AM - 12:00 PM", filterController),
                 timeChip("12:00 PM - 09:00 PM", filterController),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                onPressed: () {
                  Get.back();
            
                  
                String sGender =filterController.selectedGender.toString();
                 String sTime=filterController.selectedTimeSlot.toString();
                  
                  // final filteredDoctors = doctorController.filterDoctors(
                  //   gender: sGender,
                  //   time: sTime,
                  // );
                doctorController.filterDoctors
              (
                gender: sGender.isEmpty ? null : sGender,
                timing: sTime.isEmpty ? null : sTime,
              );
                Get.back(); // Close the dialog
                  },

                child: customText(text: "SUBMIT",color: textColor),
              ),
            )
          ],
        )),
        barrierDismissible: true,
  );
 
}

