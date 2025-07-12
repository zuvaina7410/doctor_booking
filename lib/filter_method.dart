import 'dart:developer';

import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/controller/doctor_controller.dart';
import 'package:doctor_booking/controller/filter_controller.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:doctor_booking/screens/filter_doctorslist.dart';
import 'package:doctor_booking/widgets/custom_choicechip.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:doctor_booking/widgets/custom_radiobutton.dart';
import 'package:doctor_booking/constants.dart';

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
            // Wrap(
            //   spacing: 10,
            //   children: [
            //     timeChip("06:00 AM - 12:00 PM", filterController),
            //     timeChip("12:00 PM - 09:00 PM", filterController),
            //   ],
            // ),
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
                  print("Selected Gender: ${filterController.selectedGender}");
                  print("Selected Time: ${filterController.selectedTimeSlot}");

                  String sGender,sTime;
                  sGender =filterController.selectedGender.toString();
                  sTime=filterController.selectedTimeSlot.toString();
                  
                  final filteredDoctors = doctorController.filterDoctors(
                    gender: sGender,
                    time: sTime,
                  );

                  Get.to(() => FilterDoctor(doctorModelList: filteredDoctors),
                  transition: Transition.zoom,
                  duration: Duration(milliseconds: 1000));
                  },

                child: customText(text: "SUBMIT",color: textColor),
              ),
            )
          ],
        )),
        barrierDismissible: true,
  );
 
}

