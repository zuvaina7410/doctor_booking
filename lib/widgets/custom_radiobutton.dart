import 'package:doctor_booking/controller/doctor_controller.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget genderRadio(String gender, DoctorController controller) {
  return Row(
    children: [
      customText(text: gender,size: 12),
      Radio<String>(
        value: gender,
        groupValue: controller.selectedGender.value,
        onChanged: (value) {
          controller.selectedGender.value = value!;
        },
      ),
    ],
  );
}