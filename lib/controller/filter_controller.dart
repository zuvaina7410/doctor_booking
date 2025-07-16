// lib/controller/filter_controller.dart
import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedGender = ''.obs;
  var selectedTimeSlot = ''.obs;

  void clearFilters() {
    selectedGender.value = '';
    selectedTimeSlot.value = '';
  } 
}
