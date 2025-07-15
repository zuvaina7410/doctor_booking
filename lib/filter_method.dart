
import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/controller/doctor_controller.dart';
import 'package:doctor_booking/widgets/custom_choicechip.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_booking/widgets/custom_radiobutton.dart';

final DoctorController doctorController = Get.find<DoctorController>();

  void showSearchDialog(BuildContext context) {
  
    Get.defaultDialog(
    
    title: "Filter by",
    radius: 5,
    content: 
 //   Obx(() => 
    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(()=>
              //child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  genderRadio("Male", doctorController),
                  genderRadio("Female", doctorController),
                  genderRadio("Others", doctorController),
                ],
              ),
            ),
             Divider(height: 25,color: mainColor,),

            const Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Obx(()=>
              //child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   timeChip("06:00 AM - 12:00 PM", doctorController),
                   timeChip("12:00 PM - 09:00 PM", doctorController),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
         onPressed: () {           
                 
               String sGender =doctorController.selectedGender.toString();
               String sTime=doctorController.selectedTiming.toString();

            doctorController.filterDoctors
              (
                gender: sGender.isEmpty ? null : sGender,
                timing: sTime.isEmpty ? null : sTime,
              );
                Get.back(); // Close the dialog
            },

                child: customText(text: "SUBMIT",color: customWhite),
              ),
            )
          ],
        )
      //  ),
      //  barrierDismissible: true,

    );
  }
