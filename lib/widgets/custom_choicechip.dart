import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/controller/doctor_controller.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget timeChip(String time, DoctorController controller) {
  final isSelected = controller.selectedTiming.value == time;

  return ChoiceChip(
     label:customText(text: time,size: 8,color:isSelected ? Colors.white : Colors.black ),
    selected: isSelected,
    selectedColor: mainColor,//Colors.black,
    backgroundColor: Colors.grey[300],
    onSelected: (_) {
      controller.selectedTiming.value = time;
    },
  );
}